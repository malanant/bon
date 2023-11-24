extends Node2D

class_name invadersSpawner

var rows = 5
var columns = 11
var spacing_x = 32
var spacing_y = 32
var invader_size = 22
var origin_position = -50
var invader_movement_grid_x = 10
var invader_movement_grid_y = 20
var movement = 1
var invader_scene = preload("res://scenes/invader.tscn")

func _ready():

	var invader_1_res = preload("res://modules/invader_1.tres")
	var invader_2_res = preload("res://modules/invader_2.tres")
	var invader_3_res = preload("res://modules/invader_3.tres")
	var global_invaders_script
	
	for row in rows:
		if row == 0:
			global_invaders_script = invader_1_res
		elif row == 1 or row == 2:
			global_invaders_script = invader_2_res
		elif row == 3 or row == 4:
			global_invaders_script = invader_3_res
			
		var row_width = (columns * 6 * 3) + ((columns - 1) * spacing_x)
		var origin_x_position = (position.x - row_width) / 2
		
		for colomn in columns:
			
			var x = origin_x_position + (colomn * 6 * 3) + (colomn * spacing_x)
			var y = origin_position + (row * invader_size) + (row * spacing_y)
			
			var spawn_position = Vector2(x, y)
			spawn_invader(global_invaders_script, spawn_position)
	
func spawn_invader(global_invaders_script, spawn_position:Vector2):
	var invader = invader_scene.instantiate() as invader
	invader.config = global_invaders_script
	invader.global_position = spawn_position
	add_child(invader)
