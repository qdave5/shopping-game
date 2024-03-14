extends Node2D


var shoppingList = preload("res://resources/ShoppingList.tres")

func storeItems():
	shoppingList.storeItems()
	
	$AudioStreamPlayer2D.play(0)
