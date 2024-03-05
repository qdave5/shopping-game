extends Node2D


onready var animation_player : AnimationPlayer = get_node("AnimationPlayer")
onready var item : Node2D = get_node("Item")
onready var shelf_sprite : Sprite = get_node("ShelfSprite")

export var item_name : String = 'potion'
export var flipH : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("idle")
	shelf_sprite.flip_h = flipH
	item.updateSpriteTexture(item_name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
