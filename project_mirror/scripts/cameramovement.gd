extends Camera2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var coinsoundeffect: AudioStreamPlayer2D = $AudioStreamPlayer2D/AudioStreamPlayer2D


func coinsound():
	coinsoundeffect.play()

func _process(delta: float) -> void:
	position.y -= 50 * delta
