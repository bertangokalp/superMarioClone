extends CharacterBody2D

@export var speed: float = 150.0 #Karakterin yatay hareket hızı
@export var jump_force: float = 300.0 #Zıplama Kuvveti
var gravity = ProjectSettings.get("physics/2d/default_gravity") #Yerçekimi değerini proje ayarlarından çektim

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	#Hareket girişleri
	var direction = Input.get_axis("move_left", "move_right") #Sol ve Sağ yönleri tanımladım.
	if direction:
		velocity.x = direction * speed #bastığı yöne git
	else:
		velocity.x = move_toward(velocity.x, 0, speed) #Eğer yön girdisi yoksa dur

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force #karakteri yukarı doğru fırlat
	
	move_and_slide() #hareketi uygula
