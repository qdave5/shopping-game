extends Control

export var isWin : bool = false

var worldLevel : Resource = preload("res://resources/WorldLevel.tres")
var mainLevel : PackedScene = load("res://scenes/worlds/MainLevel.tscn")


func _on_Button_pressed():
	if isWin:
		worldLevel.nextLevel()
	else:
		worldLevel.resetLevel()
	get_tree().change_scene_to(mainLevel)
