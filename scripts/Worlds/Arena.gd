extends Node2D

@onready var ScoreValue: Label = $ScoreValue

@onready var PauseMenu: Control = get_node("PauseMenu")
@onready var PlayerStick: CharacterBody2D = get_node("PlayerStick")
@onready var Ball: CharacterBody2D = get_node("Ball")

var screenshot_path:= "user://temp/screenshot.png"

signal game_paused

func _ready() -> void:
	ScoreManager.load_scores()
	ScoreValue.text = str(ScoreManager.score) + "\n" + str(ScoreManager.highscore)
	
	PauseMenu.game_resumed.connect(on_game_resumed)
	game_paused.connect(on_game_paused)
	





func _process(_delta):
	
	
	if Input.is_action_just_pressed("ui_cancel"):
		if not PauseMenu.visible:
			emit_signal("game_paused")
		elif PauseMenu.visible:
			on_game_resumed()


func on_game_resumed():
	PlayerStick.frozen = false
	Ball.frozen = false
	PauseMenu.visible = false

func on_game_paused():
	PlayerStick.frozen = true
	Ball.frozen = true
	PauseMenu.visible = true
