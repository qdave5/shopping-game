extends ColorRect

var shoppingList = load("res://resources/ShoppingList.tres")

func _ready():
	updateLabel()


func updateLabel():
	var label = ""
	print(shoppingList.listItems)
	
	for listItem in shoppingList.listItems:
		print(listItem)
		label += "- %s %s x%d\n" % [listItem.get("color"), listItem.get("name"), listItem.get("count")]
	
	print(label)
	$CenterContainer/Label.text = label
