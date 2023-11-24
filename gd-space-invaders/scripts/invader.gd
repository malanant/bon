extends Area2D

class_name invader

@onready var sprite_2d = $Sprite2D
var config: Resource

func _ready():
	sprite_2d.texture = config.sprite_1

func _on_area_entered(area):
	if area is Laser:
		area.queue_free()
		queue_free()
		print("Ennemi touché")
		get_parent().get_parent().get_node("player").get_node("shooting").laser_destroyed()
