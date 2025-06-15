class_name UI extends Control


@onready var score: Label = $ColorRect/HBoxContainer/Score
@onready var highScore: Label = $ColorRect/HBoxContainer/HighScore
var hScore: int = 0
var newMenu

var pauseMenu = load("res://Scenes/PauseMenu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause") && !get_tree().paused:
		get_tree().paused = true
		newMenu = pauseMenu.instantiate()
		add_child(newMenu)
		newMenu.position.x = 200
		newMenu.position.y = 100
		
	elif Input.is_action_just_pressed("Pause") && get_tree().paused:
		newMenu.queue_free()
		get_tree().paused = false
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
