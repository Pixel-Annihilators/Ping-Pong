extends SpinBox


func _ready() -> void:
	value = SettingsSaveManager.settings["stick_speed_multiplier"]

func _value_changed(new_value: float) -> void:
	SettingsSaveManager.settings["stick_speed_multiplier"] = new_value
	SettingsSaveManager.save_settings()
