extends Node2D


onready var animationPlayer : AnimationPlayer = get_node("ItemOnShelfAnimationPlayer")
onready var item : Node2D = get_node("%Item")
onready var shelfSprite : Sprite = get_node("%ShelfSprite")
onready var selectionEffect : Sprite = get_node("%SelectionEffect")

onready var mainColor : Dictionary = get_node("/root/Global").MAIN_COLOR
onready var mainTheme : Dictionary = get_node("/root/Global").MAIN_THEME

var inventory : Inventory = preload("res://resources/Inventory.tres")

export var itemName : String = 'Potion'
export var pathName : String = 'potion'
export var flipH : bool = false

var canTakeItem : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	animationPlayer.play("idle")
	shelfSprite.flip_h = flipH
	shelfSprite.modulate = mainTheme['summer'].level.shelf
	item.updateSpriteTexture(pathName)

func _process(delta):
	pass

func takeItem():
	if inventory.items.size() == inventory.MAX_SIZE:
		print("inventory is full")
	else:
		print("take item")
		
		var newItem = Item.new()
		newItem.name = itemName
		newItem.lineTexture = item.line_sprite.texture
		newItem.persistTexture = item.persist_sprite.texture
		newItem.colorTexture = item.color_sprite.texture
		newItem.color = "white"
		
		inventory.add_item(newItem)
		$AudioStreamPlayer2D.play(0)
		
		updateSelectionAreaColor()

func _on_SelectionArea_area_entered(area):
	if (area.name == "SelectArea"):
		canTakeItem = not canTakeItem
		updateSelectionAreaColor()

func _on_SelectionArea_area_exited(area):
	if (area.name == "SelectArea"):
		canTakeItem = not canTakeItem
		selectionEffect.modulate = mainColor.white

func updateSelectionAreaColor():
	if inventory.items.size() == inventory.MAX_SIZE:
		selectionEffect.modulate = mainColor.danger
	else:
		selectionEffect.modulate = mainColor.success
