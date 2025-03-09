extends Control

@onready var bgm: AudioStreamPlayer = $bgm

var playing := false

func _on_replay_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Worlds/Arena.tscn")


func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Menus/MainMenu.tscn")

func _process(_delta):
	if visible and (not playing):
		bgm.play()
		playing = true
	elif (not visible) and (playing):
		bgm.stop()
