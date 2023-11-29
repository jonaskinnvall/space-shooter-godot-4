extends ColorRect

@onready var highscore_label = $HighscoreLabel


func _ready():
	var highscore = SaveLoad.load_score()
	if highscore == null: return 
	
	highscore_label.text = "Highscore: " + str(highscore)


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://start_menu.tscn")
