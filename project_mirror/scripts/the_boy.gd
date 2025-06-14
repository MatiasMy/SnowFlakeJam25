extends CharacterBody2D

@onready var timer: Timer = $Timer

const SPEED = 300.0
const JUMP_VELOCITY = -500.0
const DOUBLE_JUMP_VELOCITY = -400.0

var canjump: bool = true

var double_jump: bool = true
var anim2play: String = "Idle"
@export var animatedSprite2d: AnimatedSprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_on_floor():
		double_jump = true;
	if canjump == false and is_on_floor():
		canjump = true
		
	if (is_on_floor() == false) and canjump and timer.is_stopped():
		timer.start()
	if Input.is_action_just_pressed("up") && !is_on_floor() && double_jump && !canjump:
		audio_stream_player_2d.play()
		velocity.y = DOUBLE_JUMP_VELOCITY
		double_jump = false;
	# Handle jump.
	if Input.is_action_just_pressed("up") && canjump:
		audio_stream_player_2d.play()
		velocity.y = JUMP_VELOCITY
		canjump = false
		
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("right"):
		velocity.x =  1 * SPEED * delta * 60
		anim2play = "WalkR"
	elif Input.is_action_pressed("left"):
		velocity.x = -1 * SPEED * delta * 60
		anim2play = "WalkL"
	else:
		velocity.x = 0
		anim2play = "Idle"
	move_and_slide()
	if !is_on_floor():
		anim2play = "Jump"
	if animatedSprite2d.animation != anim2play:
		animatedSprite2d.play(anim2play)
	animatedSprite2d.play(anim2play)
	
func _on_timer_timeout() -> void:
	canjump = false
