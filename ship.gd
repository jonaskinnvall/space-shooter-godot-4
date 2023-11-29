extends Area2D

signal destroyed
const LASER_SCENE = preload("res://laser.tscn")
@export var speed = 100
var height = ProjectSettings.get_setting('display/window/size/viewport_height')

func _process(delta):
	if Input.is_action_pressed("ui_down"):
		if position.y < height - 8:
			position.y += speed * delta
	if Input.is_action_pressed("ui_up"):
		if position.y > 0 + 8:
			position.y -= speed * delta
	if Input.is_action_just_pressed("ui_accept"):
		var laser = LASER_SCENE.instantiate()
		var world = get_tree().current_scene
		world.add_child(laser)
		laser.position = position


func _on_area_entered(area):
	area.queue_free()
	queue_free()
	destroyed.emit()
