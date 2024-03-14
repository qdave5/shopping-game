extends Control


export var item : Resource

onready var globalColor : Dictionary = get_node("/root/Global").MAIN_COLOR

onready var lineTextureRect : TextureRect = get_node("%LineTextureRect")
onready var persistTextureRect : TextureRect = get_node("%PersistTextureRect")
onready var colorTextureRect : TextureRect = get_node("%ColorTextureRect")

onready var itemLabel : Label = get_node("%ItemLabel")

func _ready():
	display_item()

func display_item():
	if item is Item:
		itemLabel.text = item.name
		lineTextureRect.texture = item.lineTexture
		persistTextureRect.texture = item.persistTexture
		colorTextureRect.texture = item.colorTexture
		colorTextureRect.modulate = globalColor[item.color]
	else:
		itemLabel.text = ""
		lineTextureRect.texture = null
		persistTextureRect.texture = null
		colorTextureRect.texture = null
		colorTextureRect.modulate = globalColor.white
