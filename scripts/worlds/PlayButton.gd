extends Control

export var isWin : bool = false

onready var worldLevel : Resource = preload("res://resources/WorldLevel.tres")
onready var mainLevel : PackedScene = preload("res://scenes/worlds/MainLevel.tscn")


func _on_Button_pressed():
	if isWin:
		worldLevel.nextLevel()
	else:
		worldLevel.resetLevel()
	get_tree().change_scene_to(mainLevel)
