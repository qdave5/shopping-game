extends Control

var calculationScreen : PackedScene = preload("res://scenes/worlds/CalculationScreen.tscn")

onready var globalColor : Dictionary = get_node("/root/Global").MAIN_COLOR
onready var labelTimer : Label = get_node("Label")

var seconds : int = 0
var minutes : int = 0
export var secondsDefault : int = 30
export var minutesDefault : int = 2

func _ready():
	resetTimer()

func _on_Timer_timeout():
	if seconds <= 0:
		if minutes > 0:
			minutes -= 1
			seconds = 60
		else:
			endLevel()
	seconds -= 1
	
	labelTimer.text = "{0}:{1}".format({0: "%02d" % minutes, 1: "%02d" % seconds})

func resetTimer():
	seconds = secondsDefault
	minutes = minutesDefault

func endLevel():
	get_tree().change_scene_to(calculationScreen)
