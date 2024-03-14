extends Node


var shoppingList = preload("res://resources/ShoppingList.tres")
var worldLevel = preload("res://resources/WorldLevel.tres")


# Called when the node enters the scene tree for the first time.
func _ready():
	var isWin = shoppingList.calculate()
	var path
	
	if isWin:
		if worldLevel.level == 3:
			path = "EndScreen"
		else:
			path = "WinScreen"
	else:
		path = "LoseScreen"
	get_tree().change_scene_to(load("res://scenes/worlds/" + path + ".tscn"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
