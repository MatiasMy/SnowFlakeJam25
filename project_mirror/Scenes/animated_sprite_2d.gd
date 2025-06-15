extends AnimatedSprite2D

@onready var pathFollower: PathFollow2D = $".."
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pathFollower.progress += 100*delta
	print()
	if global_position.x > 480:
		play("Plane")
	else:
		play("Bird")
	pass
