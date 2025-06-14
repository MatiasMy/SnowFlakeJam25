class_name Bullet extends Area2D


var speed = 750

func _physics_process(delta):
	position -= transform.y * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Breakable"):
		body.get_parent().queue_free()
	queue_free()
	pass # Replace with function body.
