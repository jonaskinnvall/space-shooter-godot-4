extends Node2D

@export var EffectScene: PackedScene
var height = ProjectSettings.get_setting('display/window/size/viewport_height')
var width = ProjectSettings.get_setting('display/window/size/viewport_width')

func _exit_tree():
	if not EffectScene is PackedScene: return
	if global_position.x < 0 or global_position.x > width: return
	if global_position.y < 0 or global_position.y > height: return
	
	var world = get_tree().current_scene
	var effect = EffectScene.instantiate()
	
	world.add_child.call_deferred(effect)
	effect.global_position = global_position
