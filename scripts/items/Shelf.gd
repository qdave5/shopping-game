extends Node2D


onready var animationPlayer : AnimationPlayer = get_node("ItemOnShelfAnimationPlayer")
onready var item : Node2D = get_node("%Item")
onready var shelfSprite : Sprite = get_node("%ShelfSprite")
onready var selectionEffect : Sprite = get_node("%SelectionEffect")

onready var mainColor : Dictionary = get_node("/root/Global").MAIN_COLOR
onready var mainTheme : Dictionary = get_node("/root/Global").MAIN_THEME

export var itemName : String = 'potion'
export var flipH : bool = false

var canTakeItem : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	animationPlayer.play("idle")
	shelfSprite.flip_h = flipH
	shelfSprite.modulate = mainTheme['summer'].level.shelf
	item.updateSpriteTexture(itemName)

func _process(delta):
	pass


func _on_SelectionArea_area_entered(area):
	if (area.name == "SelectArea"):
		canTakeItem = not canTakeItem
		selectionEffect.modulate = mainColor['success']


func _on_SelectionArea_area_exited(area):
	if (area.name == "SelectArea"):
		canTakeItem = not canTakeItem
		selectionEffect.modulate = mainColor['white']
