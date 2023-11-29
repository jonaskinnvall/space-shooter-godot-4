extends Node

const SAVE_PATH = "user://save.cfg"

func save_score(highscore):
	var config = ConfigFile.new()
	config.set_value("game", "highscore", highscore)
	config.save(SAVE_PATH)
	
func load_score():
	var config = ConfigFile.new()
	
	var error = config.load(SAVE_PATH)
	if error != OK: return
	
	var highscore = config.get_value("game","highscore")
	return highscore
