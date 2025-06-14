extends Node

var highScore: float = 0

# When this loads up, it should set highScore to be the one in the JSON...

func getScore() -> float:
	return highScore

func setScore(newScore: float):
	highScore = newScore

func save_game():
	var save_file = FileAccess.open("res://SaveLoc/saveables.tres", FileAccess.WRITE)
	
	if scene_file_path.is_empty():
		print("persistent node '%s' is not an instanced scene, skipped" % name)

		# Check the node has a save function.
	if has_method("save"):
		print("persistent node '%s' is missing a save() function, skipped" % name)

		# Call the node's save function.
	var node_data = {
		"highScore" = highScore
	}

		# JSON provides a static method to serialized JSON string.
	var json_string = JSON.stringify(node_data)

		# Store the save dictionary as a new line in the save file.
	save_file.store_line(json_string)
	

func load_game():
	if not FileAccess.file_exists("res://SaveLoc/saveables.tres"):
		return # Error! We don't have a save to load.
		
	var save_file = FileAccess.open("res://SaveLoc/saveables.tres", FileAccess.READ)
	while save_file.get_position() < save_file.get_length():
		var json_string = save_file.get_line()

		# Creates the helper class to interact with JSON.
		var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure.
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		# Get the data from the JSON object.
		var node_data = json.data
		
		highScore = node_data["highScore"]
		
		# Firstly, we need to create the object and add it to the tree and set its position.
		var new_object = load(node_data["filename"]).instantiate()
		get_node(node_data["parent"]).add_child(new_object)
		new_object.position = Vector2(node_data["pos_x"], node_data["pos_y"])

		# Now we set the remaining variables.
		for i in node_data.keys():
			if i == "filename" or i == "parent" or i == "pos_x" or i == "pos_y":
				continue
			new_object.set(i, node_data[i])
