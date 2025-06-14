class_name Game extends Node2D

@onready var ui: UI = $Camera2D/Ui
var score: float = 0

func addtoscore():
	print("fi")
	score = score + 50

func _process(delta: float) -> void:
	score += 10*delta
	ui.updateScore(score)
	ui.updateHighScore(score)
