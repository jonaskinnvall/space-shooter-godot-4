extends Node2D

const EnemyScene = preload("res://enemy.tscn")
@onready var spawn_points = $SpawnPoints


func get_spawn_position():
	var points = spawn_points.get_children()
	var random_point = points.pick_random()
	
	return random_point.global_position


func spawn_enemy():
	var enemy = EnemyScene.instantiate()
	var world = get_tree().current_scene
	
	world.add_child(enemy)
	
# 	Could also use enemy.global_position but it's the same 
# 	since the enemy is a child of the world scene
	enemy.position = get_spawn_position()


func _on_timer_timeout():
	spawn_enemy()
