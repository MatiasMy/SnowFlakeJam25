extends CharacterBody2D
class_name mirroredboy

const SPEED = 300.0
const JUMP_VELOCITY = -500.0
const DOUBLE_JUMP_VELOCITY = -400.0
var isplane: bool = false

@onready var timer: Timer = $Timer

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
	
		# Handle jump.
		if Input.is_action_just_pressed("uparrow") && is_on_floor():
			velocity.y = JUMP_VELOCITY
			
		if Input.is_action_just_pressed("uparrow") && !is_on_floor() && double_jump:
			velocity.y = DOUBLE_JUMP_VELOCITY
			double_jump = false;
	
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
		print("olen leno kone")
		anim2play = "IdleP"
			
	if animatedSprite2d.animation != anim2play:
		animatedSprite2d.play(anim2play)
	animatedSprite2d.play(anim2play)
	
func _on_timer_timeout() -> void:
	isplane = true
	
	
