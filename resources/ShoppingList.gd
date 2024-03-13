extends Resource
class_name ShoppingList

var inventory = preload("res://resources/Inventory.tres")

export(Array, Dictionary) var listItems = [
	{
		"name": "Apple",
		"color": "red",
	}
]
export(Array, Resource) var storeItems = []

func storeItems():
	while inventory.items.size() > 0:
		var item = inventory.remove_item(0)
		storeItems.append(item)

func checkEquals():
	for item in storeItems:
		for listItem in listItems:
			if listItem.get("name") == item.name && listItem.get("color") == item.color:
				print("yes")
