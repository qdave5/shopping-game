extends Node2D


onready var animationPlayer : AnimationPlayer = get_node("ItemOnShelfAnimationPlayer")
onready var item : Node2D = get_node("%Item")
onready var shelfSprite : Sprite= get_node("%ShelfSprite")

onready var shelfColor : String = get_node("/root/Global").MAIN_THEME['summer'].palette3

export var itemName : String = 'potion'
export var flipH : bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	animationPlayer.play("idle")
	shelfSprite.flip_h = flipH
	shelfSprite.modulate = shelfColor
	item.updateSpriteTexture(itemName)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
