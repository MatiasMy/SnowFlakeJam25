extends Area2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _on_body_entered(body: Node2D) -> void:
	var gamescript = get_node("/root/Game")
	gamescript.addtoscore()
	audio_stream_player_2d.play()
	queue_free()
		
