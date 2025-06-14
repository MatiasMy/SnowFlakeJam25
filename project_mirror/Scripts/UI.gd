class_name UI extends Control


@onready var score: Label = $ColorRect/HBoxContainer/Score
@onready var highScore: Label = $ColorRect/HBoxContainer/HighScore
var hScore: int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func updateScore(newScore: int) -> void:
	score.text = ("Score: " + str(newScore))
	pass
	
func updateHighScore(newScore: int) -> void:
	if HighScore.score < newScore:
		highScore.text = ("High Score: " + str(newScore))
		HighScore.score = newScore
	else :
		highScore.text = ("High Score: " + str(HighScore.score))
	pass
