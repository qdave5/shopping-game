extends Control

var shoppingList = preload("res://resources/ShoppingList.tres")

onready var labelList : Label = get_node("%Label")

func _ready():
	shoppingList.connect("list_items_changed", self, "_on_list_items_changed")
	updateLabel(shoppingList.listItems)


func updateLabel(listItems):
	var label = ""
	
	for listItem in listItems:
		print("listItem", listItem)
		label += "- %s %s x%d\n" % [listItem.get("color"), listItem.get("name"), listItem.get("count")]
	
	print("label ", label)
	labelList.text = label

func _on_list_items_changed():
	print("on item list changed")
	updateLabel(shoppingList.listItems)
