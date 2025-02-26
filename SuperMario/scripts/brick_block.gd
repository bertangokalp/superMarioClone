extends StaticBody2D

@onready var sprite = $Sprite2D
@onready var area = $Area2D

func _ready():
	area.body_entered.connect(bodyEntered)

func bodyEntered(body):
	if body.name == "Player":
		bounce()

func bounce():
	var tween = get_tree().create_tween() #bir tween oluştur
	tween.tween_property(self, "position:y", position.y -5, 0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	#Bloğu 5 pixel yukarı hareket ettir
	tween.tween_property(self, "position:y", position.y, 0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	#Bloğu eski haline döndür
