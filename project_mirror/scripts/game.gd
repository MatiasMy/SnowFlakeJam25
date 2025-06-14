class_name Game extends Node2D

@onready var ui: UI = $Camera2D/Ui
@onready var saveables = $Saveables
var score: float

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	score += 60 * delta
	ui.updateScore(score)
	ui.updateHighScore(score)
