class_name Game extends Node2D

@onready var ui: UI = $Camera2D/Ui
var score: float = 0
func addtoscore():
	score = score + 50
	
func _ready() -> void:
	AudioServer.set_bus_volume_db(
		0,
		linear_to_db(HighScore.volume)
	)

func _process(delta: float) -> void:
	score += 2*delta
	ui.updateScore(score)
	ui.updateHighScore(score)
	
