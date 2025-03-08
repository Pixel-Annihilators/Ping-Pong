extends Button



func _pressed():
	var PauseMenu : Control = get_node("../../../")
	
	PauseMenu.visible = false
