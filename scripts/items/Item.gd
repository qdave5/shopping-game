extends Node2D

onready var line_sprite : Sprite = get_node("LineSprite")
onready var persist_sprite : Sprite = get_node("PersistSprite")
onready var color_sprite : Sprite = get_node("ColorSprite")

export var item_name : String = 'apple'

const DEFAULT_PATH : String = 'res://assets/items/'

const LINE_PATH : String = '/line.png'
const PERSIST_PATH : String = '/persist.png'
const COLOR_PATH : String = '/color.png'

func _ready():
	updateSpriteTexture(item_name)

func updateSpriteTexture(item_name):
	line_sprite.texture = load(DEFAULT_PATH + item_name + LINE_PATH)
	persist_sprite.texture = load(DEFAULT_PATH + item_name + PERSIST_PATH)
	color_sprite.texture = load(DEFAULT_PATH + item_name + COLOR_PATH)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
