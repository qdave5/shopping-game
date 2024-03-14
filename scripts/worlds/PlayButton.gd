extends Control

export var isWin : bool = false

var worldLevel : Resource = preload("res://resources/WorldLevel.tres")
var mainLevel : PackedScene = load("res://scenes/worlds/MainLevel.tscn")
var mainMenu : PackedScene = load("res://scenes/worlds/Main.tscn")

func _on_Button_pressed():
	if isWin:
		worldLevel.nextLevel()
	else:
		worldLevel.resetLevel()
	#yield(get_tree().create_timer(1.5), "timeout")
	
	if worldLevel.level > 3:
		worldLevel.resetLevel()
		get_tree().change_scene_to(mainMenu)
	else:
		get_tree().change_scene_to(mainLevel)
