class_name Saveables extends Node

var highScore: float = 0

# When this loads up, it should set highScore to be the one in the JSON...

func getScore() -> float:
	return highScore

func setScore(newScore: float):
	highScore = newScore
