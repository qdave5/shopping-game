extends Node


var winScreen = preload("res://scenes/worlds/WinScreen.tscn")
var loseScreen = preload("res://scenes/worlds/LoseScreen.tscn")

var shoppingList = preload("res://resources/ShoppingList.tres")


# Called when the node enters the scene tree for the first time.
func _ready():
	print(shoppingList.calculate())
	#get_tree().change_scene_to(winScreen)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
