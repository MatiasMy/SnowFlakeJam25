extends CharacterBody2D
class_name mirroredboy

const SPEED = 300.0
const JUMP_VELOCITY = -500.0
const DOUBLE_JUMP_VELOCITY = -400.0
var isplane: bool = false
var canjump = true

@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2

var double_jump: bool = true
var anim2play: String = "Idle"
@export var animatedSprite2d: AnimatedSprite2D

func beplane() -> void:
	timer.start()

func _physics_process(delta: float) -> void:
	
	if !isplane:
		if not is_on_floor():
			velocity += get_gravity() * delta
		if is_on_floor():
			double_jump = true;
		if canjump == false and is_on_floor():
			canjump = true
	
		# Handle jump.
		if (is_on_floor() == false) and canjump and timer_2.is_stopped():
			timer_2.start()
		if Input.is_action_just_pressed("uparrow") && !is_on_floor() && double_jump && !canjump:
			velocity.y = DOUBLE_JUMP_VELOCITY
			double_jump = false;
		# Handle jump.
		if Input.is_action_just_pressed("uparrow") && canjump:
			velocity.y = JUMP_VELOCITY
			canjump = false
	
		if Input.is_action_pressed("rightarrow"):
			velocity.x =  1 * SPEED * delta * 60
			anim2play = "WalkR"
		elif Input.is_action_pressed("leftarrow"):
			velocity.x = -1 * SPEED * delta * 60
			anim2play = "WalkL"
		else:
			velocity.x = 0
			anim2play = "Idle"
		move_and_slide()
		if !is_on_floor():
			anim2play = "Jump"
			
	if isplane:
		anim2play = "IdleP"
		if Input.is_action_pressed("uparrow"):
			velocity.y =  -1 * 100 * delta * 60
			anim2play = "Fly"
		if Input.is_action_pressed("downarrow"):
			velocity.y =  1 * 100 * delta * 60
			anim2play = "Fly"
		if Input.is_action_pressed("rightarrow"):
			velocity.x =  1 * 100 * delta * 60
			anim2play = "Fly"
		if Input.is_action_pressed("leftarrow"):
			velocity.x =  -1 * 100 * delta * 60
			anim2play = "Fly"
		move_and_slide()
	if animatedSprite2d.animation != anim2play:
		animatedSprite2d.play(anim2play)
	animatedSprite2d.play(anim2play)
	
func _on_timer_timeout() -> void:
	isplane = true

func _on_timer_2_timeout() -> void:
	canjump = false
