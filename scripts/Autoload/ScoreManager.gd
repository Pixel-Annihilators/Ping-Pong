extends Node


var score_path := "user://score.json"
var score : int = 0
var highscore: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_scores()

func save_scores() -> void:
	# no matter what, overwrite score.json with current scores
	var temp_dict : Dictionary = {"score": score, "highscore": highscore}
	var fh = FileAccess.open(score_path, FileAccess.WRITE)
	fh.store_string(JSON.stringify(temp_dict))
	fh.close()

func load_scores() -> void:
	# if scores.json doesnt exist, create one
	if not FileAccess.file_exists(score_path):
		save_scores()
		return
	
	var fh = FileAccess.open(score_path, FileAccess.READ)
	var temp_dict : Dictionary = JSON.parse_string(fh.get_as_text())
	fh.close()
	
	score = 0
	highscore = temp_dict["highscore"]
