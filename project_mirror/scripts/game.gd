class_name Game extends Node2D

@onready var ui: UI = $Camera2D/Ui
var score: float = 0
var pauseMenu = load("res://Scenes/PauseMenu.tscn")
func addtoscore():
	score = score + 50
	
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	AudioServer.set_bus_volume_db(
		0,
		linear_to_db(HighScore.volume)
	)

func _process(delta: float) -> void:
	score += 2*delta
	ui.updateScore(score)
	ui.updateHighScore(score)
	
	if Input.is_action_just_pressed("Pause"):
		get_tree().paused = true
		var newMenu = pauseMenu.instantiate()
		add_child(newMenu)
