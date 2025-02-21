extends CharacterBody2D

func round_to_n(num: float, digit: int) -> float:
	return round(num * pow(10.0, digit)) / pow(10.0, digit)

var move_cstick : bool = true

func _process(delta) -> void:
	if move_cstick:
		position.y = BallPositionUpdater.position.y
		


	var collision = move_and_collide(velocity*delta)
	if collision:
		move_cstick = false

	if round_to_n(BallPositionUpdater.position.y, 0)==round_to_n(position.y, 0):
		move_cstick = true
	
