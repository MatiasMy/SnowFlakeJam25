extends Area2D



func _on_body_entered(body: Node2D) -> void:
	var gamescript = get_node("/root/Game")
	gamescript.addtoscore()
	queue_free()
		
