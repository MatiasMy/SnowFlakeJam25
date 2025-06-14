extends Area2D

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.velocity.y = -700
	if body is mirroredboy:
		body.beplane()
