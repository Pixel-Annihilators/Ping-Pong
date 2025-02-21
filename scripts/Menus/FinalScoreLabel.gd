extends Label


func _ready() -> void:
	text = "SCORE: "+str(ScoreManager.score)+"\n"+"HIGHSCORE: "+str(ScoreManager.highscore)
