extends Area2D


func _on_body_entered(body: Node2D) -> void:
	var gamescript = get_node("/root/Game")
	gamescript.addtoscore()
	var camscript = get_node("/root/Game/Camera2D")
	camscript.coinsound()
	queue_free()
	
