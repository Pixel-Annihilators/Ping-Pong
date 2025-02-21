extends Control



func _on_replay_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Worlds/Arena.tscn")


func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Menus/MainMenu.tscn")
