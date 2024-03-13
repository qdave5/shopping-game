extends Node


var winScreen = preload("res://scenes/worlds/WinScreen.tscn")
var loseScreen = preload("res://scenes/worlds/LoseScreen.tscn")

var shoppingList = preload("res://resources/ShoppingList.tres")


# Called when the node enters the scene tree for the first time.
func _ready():
	var isWin = shoppingList.calculate()
	
	if isWin:
		get_tree().change_scene_to(winScreen)
	else:
		get_tree().change_scene_to(loseScreen)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
