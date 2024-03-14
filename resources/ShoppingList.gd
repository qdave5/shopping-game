extends Resource
class_name ShoppingList

var inventory = preload("res://resources/Inventory.tres")
var worldLevel = preload("res://resources/WorldLevel.tres")

signal list_items_changed()

export(Array, Dictionary) var listItems = []
export(Array, Resource) var storedItems = []

var dummyListItems = {
	1: [
		{
			"name": "Apple",
			"color": "white",
			"count": 1
		},
		{
			"name": "Ice Cone",
			"color": "blue",
			"count": 1
		},
		{
			"name": "Potion",
			"color": "yellow",
			"count": 1
		},
		{
			"name": "Apple",
			"color": "orange",
			"count": 1
		},
		{
			"name": "Potion Square",
			"color": "purple",
			"count": 2
		},
	],
	2: [
		{
			"name": "Apple",
			"color": "red",
			"count": 3
		},
		{
			"name": "Apple",
			"color": "orange",
			"count": 2
		},
		{
			"name": "Apple",
			"color": "blue",
			"count": 2
		},
		{
			"name": "Melon",
			"color": "green",
			"count": 2
		},
		{
			"name": "Potion",
			"color": "red",
			"count": 2
		},
		{
			"name": "Potion Long",
			"color": "purple",
			"count": 3
		},
		{
			"name": "Potion Long",
			"color": "yellow",
			"count": 2
		},
	],
	3: [
		{
			"name": "Apple",
			"color": "red",
			"count": 5
		},
		{
			"name": "Melon",
			"color": "purple",
			"count": 1
		},
		{
			"name": "Ice Cream",
			"color": "brown",
			"count": 1
		},
		{
			"name": "Ice Cream",
			"color": "green",
			"count": 1
		},
		{
			"name": "Ice Cone",
			"color": "red",
			"count": 1
		},
		{
			"name": "Potion",
			"color": "red",
			"count": 1
		},
		{
			"name": "Potion",
			"color": "blue",
			"count": 1
		},
		{
			"name": "Potion",
			"color": "yellow",
			"count": 1
		},
		{
			"name": "Potion Long",
			"color": "blue",
			"count": 2
		},
		{
			"name": "Potion Square",
			"color": "green",
			"count": 1
		},
		{
			"name": "Potion Square",
			"color": "yellow",
			"count": 1
		},
		{
			"name": "Potion Triangle",
			"color": "orange",
			"count": 2
		},
	]
}

func storeItems():
	while inventory.items.size() > 0:
		var item = inventory.remove_item(0)
		storedItems.append(item)

func calculate():
	for item in storedItems:
		for listItem in listItems:
			if listItem.get("name") == item.name && listItem.get("color") == item.color:
				listItem.count -= 1
	
	var count = 0
	for listItem in listItems:
		count += listItem.count
	
	return count == 0

func resetStoredItems():
	storedItems = []

func generateListItems():
	listItems = dummyListItems[worldLevel.level]
	emit_signal("list_items_changed")
