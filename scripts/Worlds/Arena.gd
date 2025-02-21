extends Node2D

@onready var ScoreValue: Label = $ScoreValue



func _ready() -> void:
	ScoreManager.load_scores()
	ScoreValue.text = str(ScoreManager.score) + "\n" + str(ScoreManager.highscore)
