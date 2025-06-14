extends Area2D

@onready var timer: Timer = $Timer
@onready var saveNodes = get_tree().get_nodes_in_group("Persist")
func _on_body_entered(body) -> void:
	print("death time")
	timer.start()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
