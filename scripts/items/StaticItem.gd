extends StaticBody2D

export var sprite_texture : Texture = preload("res://assets/backgrounds/offset_bg.png")

export var collisionScaleX : float = 1
export var collisionScaleY : float = 1

onready var sprite : Sprite = get_node("Sprite")
onready var collision_shape_2d : CollisionShape2D = get_node("CollisionShape2D")

func _ready():
	sprite.texture = sprite_texture
	
	collision_shape_2d.scale = Vector2(collisionScaleX, collisionScaleY)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
