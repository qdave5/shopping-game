extends Resource
class_name ShoppingList

var inventory = preload("res://resources/Inventory.tres")

export(Array, Dictionary) var listItems = [
	{
		"name": "Apple",
		"color": "red",
		"count": 1,
	}
]
export(Array, Resource) var storeItems = []

func storeItems():
	while inventory.items.size() > 0:
		var item = inventory.remove_item(0)
		storeItems.append(item)

func calculate():
	
	
	for item in storeItems:
		for listItem in listItems:
			print("item name :", item.name, "| item color :", item.color)
			print("listItem :", listItem)
			if listItem.get("name") == item.name && listItem.get("color") == item.color:
				print("yes")
				listItem.count -= 1
	
	var count = 0
	for listItem in listItems:
		count += listItem.count
	
	return count == 0
