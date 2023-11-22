extends Area2D

@export var speed = 100
const LASER_SCENE = preload("res://laser.tscn")

func _process(delta):
	if Input.is_action_pressed("ui_down"):
		position.y += speed*delta
	if Input.is_action_pressed("ui_up"):
		position.y -= speed*delta
	if Input.is_action_just_pressed("ui_accept"):
		var laser = LASER_SCENE.instantiate()
		var world = get_tree().current_scene
		world.add_child(laser)
		laser.position = position


func _on_area_entered(area):
	area.queue_free()
	queue_free()
