class_name Game extends Node2D

@onready var ui: UI = $Camera2D/Ui
var score: float = 0
func _process(delta: float) -> void:
	score += 60*delta
	ui.updateScore(score)
	ui.updateHighScore(score)
