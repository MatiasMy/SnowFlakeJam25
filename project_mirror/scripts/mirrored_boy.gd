extends CharacterBody2D
class_name mirroredboy

const SPEED = 300.0
const JUMP_VELOCITY = -500.0
const DOUBLE_JUMP_VELOCITY = -400.0
var isplane: bool = false
var issuperboyd: bool = false
var canjump = true

@onready var jumpsound: AudioStreamPlayer2D = $AudioStreamPlayer2D

@onready var shootsound: AudioStreamPlayer2D = $AudioStreamPlayer2D2

@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2

var bullet = load("res://Scenes/Bullet.tscn")
var double_jump: bool = true
var anim2play: String = "Idle"
var isPushing: bool = false
var nodeToPush: Node
@export var animatedSprite2d: AnimatedSprite2D

func beplane() -> void:
	timer.start()
func beother() -> void:
	isplane = false
	issuperboyd = true
func benormal() -> void:
	isplane = false
	issuperboyd = false

func _physics_process(delta: float) -> void:
	
	if !isplane && !issuperboyd:
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
			jumpsound.play()
			velocity.y = DOUBLE_JUMP_VELOCITY
			double_jump = false;
		# Handle jump.
		if Input.is_action_just_pressed("uparrow") && canjump:
			jumpsound.play()
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
			
	if isplane && !issuperboyd:
		anim2play = "IdleP"
		if Input.is_action_just_pressed("spacebar"):
			shootsound.play()
			var newBullet = bullet.instantiate()
			add_child(newBullet)
			
		if Input.is_action_pressed("uparrow"):
			velocity.y =  -1 * 150 * delta * 60
			anim2play = "Fly"
		elif Input.is_action_pressed("downarrow"):
			velocity.y =  1 * 150 * delta * 60
			anim2play = "Fly"
		elif Input.is_action_pressed("rightarrow"):
			velocity.x =  1 * 150 * delta * 60
			anim2play = "Fly"
		elif Input.is_action_pressed("leftarrow"):
			velocity.x =  -1 * 150 * delta * 60
			anim2play = "Fly"
		else :
			velocity.x = 0
			velocity.y = 0
		
		move_and_slide()
	if animatedSprite2d.animation != anim2play:
		animatedSprite2d.play(anim2play)
	animatedSprite2d.play(anim2play)
	
	if issuperboyd:
		anim2play = "SuperI"
		if Input.is_action_pressed("uparrow"):
			velocity.y =  -1 * 150 * delta * 60
			anim2play = "SuperU"
		elif Input.is_action_pressed("downarrow"):
			velocity.y =  1 * 150 * delta * 60
			anim2play = "SuperL"
		elif Input.is_action_pressed("rightarrow"):
			velocity.x =  1 * 150 * delta * 60
			anim2play = "SuperR"
		elif Input.is_action_pressed("leftarrow"):
			velocity.x =  -1 * 150 * delta * 60
			anim2play = "SuperL"
		else :
			velocity.x = 0
			velocity.y = 0
		#if isPushing:
		#	var pushables = nodeToPush.get_children()
		#	for node in pushables:
		#		node.apply_central_impulse(Vector2(0, -50))
		move_and_slide()
	if animatedSprite2d.animation != anim2play:
		animatedSprite2d.play(anim2play)
	animatedSprite2d.play(anim2play)
	
	
func _on_timer_timeout() -> void:
	isplane = true

func _on_timer_2_timeout() -> void:
	canjump = false
	

func _on_push_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Breakable") && issuperboyd:
		var pushables = body.get_parent().get_children()
		for node in  pushables:
			node.apply_central_impulse(Vector2(0, -50))
		print(nodeToPush)

func _on_push_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("Breakable") && issuperboyd:
		var pushables = body.get_parent().get_children()
		for node in  pushables:
			node.apply_central_impulse(Vector2(0, 50))
