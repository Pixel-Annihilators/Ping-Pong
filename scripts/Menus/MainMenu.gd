extends Control

@onready var MainMenuMarginContainer: MarginContainer = $MarginContainer
@onready var CreditsScene: Control = $CreditsScene
@onready var SettingsScene: Control = $SettingsScene
@onready var ArenaScene: Node2D = $Arena



func _on_credits_button_pressed() -> void:
	MainMenuMarginContainer.visible = false
	CreditsScene.visible = true

func _on_settings_button_pressed() -> void:
	MainMenuMarginContainer.visible = false
	SettingsScene.visible = true




func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Worlds/Arena.tscn")
	


	
