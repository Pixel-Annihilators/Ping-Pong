extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_settings_back_button_pressed() -> void:
	var prev = $"../MarginContainer" as MarginContainer
	var current = $"./" as Node
	
	current.visible = false
	prev.visible = true
