extends Node2D

@export var laser_scene: PackedScene
@export var laser_existed = false

func _input(event):
	if Input.is_action_pressed("shoot") and laser_existed == false:
		laser_existed = true
		var laser = laser_scene.instantiate() as Laser
		laser.global_position = get_parent().global_position
		get_tree().root.get_node("game").add_child(laser)
		print("Le joueur tire")

func laser_destroyed():
	laser_existed = false
	print("Le joueur peut tirer")
