extends CharacterBody2D

var stick_speed_multiplier : float 
var SPEED: float
var frozen := false

func _ready() -> void:
	stick_speed_multiplier = SettingsSaveManager.settings["stick_speed_multiplier"]
	SPEED = 400.0 * stick_speed_multiplier

func _process(_delta: float) -> void:
	var temp_speed = SPEED*1
	if not frozen:
		if Input.is_action_just_pressed("up"):
			velocity.y = -temp_speed
		elif Input.is_action_pressed("down"):
			velocity.y = temp_speed
		elif Input.is_action_just_released("down") or Input.is_action_just_released("up"):
			velocity.y = 0.0
	
	if position.x!=17:
		position.x = 17
	
	PlayerStickVelocityUpdater.velocity = velocity
	
	move_and_slide()


#func _process(_delta):
	#
	#var temp_speed = SPEED*1
	#velocity = Vector2(1,1)
#
	##if Input.is_action_pressed("sprint"):
		##temp_speed = SPEED*2.5
#
	#if Input.is_action_pressed("up"):
		#velocity.y = -temp_speed
	#elif Input.is_action_pressed("down"):
		#velocity.y = temp_speed
	#if Input.is_action_pressed("left"):
		#velocity.x = -temp_speed
	#elif Input.is_action_pressed("right"):
		#velocity.x = temp_speed
#
	#move_and_slide()

	
