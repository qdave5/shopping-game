extends Node2D

var calculationScreen = preload("res://scenes/worlds/CalculationScreen.tscn")

func endLevel():
	print("end level")
	get_tree().change_scene_to(calculationScreen)
