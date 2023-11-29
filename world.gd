extends Node2D

@onready var score_label = $ScoreLabel

var score = 0:
	get:
		return score
	set(value):
		score = value
		score_label.text = "Score: " + str(score)
		



func _on_ship_destroyed():
	await get_tree().create_timer(1.0).timeout
	
	var highscore = SaveLoad.load_score()
	if highscore != null:
		if score > highscore:
			SaveLoad.save_score(score)
	else: SaveLoad.save_score(score)
	
	get_tree().change_scene_to_file("res://game_over_screen.tscn")
