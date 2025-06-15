extends HSlider
var bus: String = "Master"

func _ready() -> void:
	value_changed.connect(_on_value_changed)
	
func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(
		0,
		linear_to_db(value)
	)
	HighScore.volume = value
	
