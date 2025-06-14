extends Area2D

func _on_body_entered(body):
	print("törmös")
	if body is mirroredboy:
		print("kybortörmös")
		body.beother()
