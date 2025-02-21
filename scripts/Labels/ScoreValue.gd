extends Label



func _ready() -> void:
	update_score()

func update_score() -> void:
	text = str(ScoreManager.score) + "\n" + str(ScoreManager.highscore)

func _on_ball_score_updated() -> void:
	update_score()
