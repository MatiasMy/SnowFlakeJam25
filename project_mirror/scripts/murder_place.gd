extends Area2D

@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _on_body_entered(body) -> void:
	print("death time")
	audio_stream_player_2d.play()
	timer.start()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
