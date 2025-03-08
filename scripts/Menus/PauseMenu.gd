extends Control




signal game_resumed

func _on_resume_button_pressed() -> void:
	emit_signal("game_resumed")
