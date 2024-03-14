extends Control

var shoppingList = preload("res://resources/ShoppingList.tres")

onready var globalColor : Dictionary = get_node("/root/Global").MAIN_COLOR

onready var labelList : RichTextLabel = get_node("%Label")

func _ready():
	shoppingList.connect("list_items_changed", self, "_on_list_items_changed")
	updateLabel(shoppingList.listItems)


func updateLabel(listItems):
	var label = ""
	
	for listItem in listItems:
		label += "- [color=#%s]%s[/color] %s x%d\n" % [globalColor[listItem.get("color")].to_html(), listItem.get("color"), listItem.get("name"), listItem.get("count")]

	labelList.bbcode_text = label

func _on_list_items_changed():
	updateLabel(shoppingList.listItems)
