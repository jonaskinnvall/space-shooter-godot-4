extends Node2D

@export var EffectScene: PackedScene

func _exit_tree():
	if not EffectScene is PackedScene: return
	
	var world = get_tree().current_scene
	var effect = EffectScene.instantiate()
	
	world.add_child.call_deferred(effect)
	effect.global_position = global_position
