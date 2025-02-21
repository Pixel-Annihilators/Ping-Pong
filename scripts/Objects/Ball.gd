extends CharacterBody2D

signal score_updated

var speed := 800.0
var start_velocity_y := randf_range(-speed*SettingsSaveManager.settings["ball_speed_multiplier"],
									speed*SettingsSaveManager.settings["ball_speed_multiplier"])

func round_to_n(num: float, digit: int) -> float:
	return round(num * pow(10.0, digit)) / pow(10.0, digit)

func dot_product(a: Vector2, b: Vector2) -> float:
	return a.x*b.x + a.y*b.y

func bounce(ball_dir: Vector2, wall_normal: Vector2) -> Vector2:
	# Normalize the mirror normal to make sure it's a unit vector
	var length = (wall_normal.x ** 2 + wall_normal.y ** 2) ** 0.5
	wall_normal.x /= length
	wall_normal.y /= length
	
	# Calculate the dot product of light direction and mirror normal
	var dot = dot_product(ball_dir, wall_normal)

	# Apply the reflection formula
	var new_x = ball_dir.x - 2 * dot * wall_normal.x
	var new_y = ball_dir.y - 2 * dot * wall_normal.y
	
	return Vector2(new_x, new_y)

func bounce_wall_moving(ball_dir: Vector2, wall_normal: Vector2, wall_velocity: Vector2) -> Vector2:
	var reflected_dir = bounce(ball_dir, wall_normal)
	var new_dir = reflected_dir + wall_velocity
	# Normalize the final direction to ensure the ball's speed remains consistent
	return new_dir




func _ready() -> void:
	var screen_size = get_viewport().get_visible_rect().size
	position = screen_size/2
	velocity.y = start_velocity_y*SettingsSaveManager.settings["ball_speed_multiplier"]
	velocity.x = speed*SettingsSaveManager.settings["ball_speed_multiplier"]



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var collision = (move_and_collide(velocity*delta))
	if collision:
		var collider = collision.get_collider()
		var normal = collision.get_normal()
		if collider == get_tree().get_first_node_in_group("PlayerSticks"):
			ScoreManager.score+=1
			if ScoreManager.score>ScoreManager.highscore:
				ScoreManager.highscore = ScoreManager.score
			ScoreManager.save_scores()
			emit_signal("score_updated")
			velocity = bounce_wall_moving(velocity, normal, PlayerStickVelocityUpdater.velocity)

		else:
			velocity = bounce(velocity, normal)
	
	BallPositionUpdater.position = position
	
	if position.x<=0:
		get_tree().quit() # replace with scoreboard connection
