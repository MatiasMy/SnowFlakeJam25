class_name LinkeBreakable extends Node2D


@onready var real = $RealSprite
@onready var imaginary = $ImaginarySprite
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_imaginary_sprite_body_entered(body: Node) -> void:
	if body is Bullet:
		queue_free()
	pass # Replace with function body.
