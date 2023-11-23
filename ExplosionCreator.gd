extends Node2D

const ExplosionEffectScene = preload("res://explosion_effect.tscn")


func _exit_tree():
	var world = get_tree().current_scene
	var explosion_effect = ExplosionEffectScene.instantiate()
	
	world.add_child.call_deferred(explosion_effect)
	explosion_effect.global_position = global_position
