extends Resource
class_name Inventory

signal items_changed(indexes)

const MAX_SIZE = 8

export(Array, Resource) var items = []

func add_item(item):
	if items.size() < MAX_SIZE:
		items.append(item)
		emit_signal("items_changed", [items.size() - 1])
		return item

func change_item_color(item_index, newColor):
	print(item_index, newColor)
	if item_index < items.size():
		items[item_index].color = newColor
		emit_signal("items_changed", item_index)
		return items[item_index]

func remove_item(item_index):
	if item_index < items.size():
		var previousItem = items[item_index]
		items.remove(item_index)
		emit_signal("items_changed", [0,1,2,3,4,5,6,7,])
		return previousItem
