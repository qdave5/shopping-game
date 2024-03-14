extends Control

onready var eraseColor = get_node("/root/Global").eraseColor
onready var globalColor : Dictionary = get_node("/root/Global").MAIN_COLOR
var mouseColor  = preload("res://resources/MouseColor.tres")
var inventory = preload("res://resources/Inventory.tres")

onready var lineTextureRect : TextureRect = get_node("LineTextureRect")
onready var persistTextureRect : TextureRect = get_node("PersistTextureRect")
onready var colorTextureRect : TextureRect = get_node("ColorTextureRect")

onready var itemEffectTextureRect : TextureRect = get_node("ItemEffectTextureRect")


func display_item(item):
	if item is Item:
		lineTextureRect.texture = item.lineTexture
		persistTextureRect.texture = item.persistTexture
		colorTextureRect.texture = item.colorTexture
		colorTextureRect.modulate = globalColor[item.color]
	else:
		lineTextureRect.texture = null
		persistTextureRect.texture = null
		colorTextureRect.texture = null
		colorTextureRect.modulate = globalColor.white


func _on_InventorySlotDisplay_gui_input(_event):
	if Input.is_mouse_button_pressed(1):
		var item_index = get_index()
		if mouseColor.color == eraseColor:
			inventory.remove_item(item_index)
		else:
			inventory.change_item_color(item_index, mouseColor.color)

func _on_InventorySlotDisplay_mouse_entered():
	itemEffectTextureRect.modulate = globalColor.success

func _on_InventorySlotDisplay_mouse_exited():
	itemEffectTextureRect.modulate = globalColor.white
