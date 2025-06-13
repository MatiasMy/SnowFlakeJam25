extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0

var double_jump: bool = true


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_on_floor():
		double_jump = true;

	# Handle jump.
	if Input.is_action_just_pressed("up") && is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("up") && !is_on_floor() && double_jump:
		velocity.y = JUMP_VELOCITY
		double_jump = false;

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("right"):
		velocity.x =  1 * SPEED * delta * 60
	else: if Input.is_action_pressed("left"):
		velocity.x = -1 * SPEED * delta * 60
	else:
		velocity.x = 0
	move_and_slide()
