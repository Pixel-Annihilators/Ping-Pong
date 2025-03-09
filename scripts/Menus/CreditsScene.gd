extends Control


func _on_back_button_pressed() -> void:
	var prev = $"../MarginContainer" as MarginContainer
	var current = $"./" as Control
	
	current.visible = false
	prev.visible = true
