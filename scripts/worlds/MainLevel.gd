extends Node2D

onready var camera : Camera2D = get_node("Camera2D")
onready var mainCharacter : KinematicBody2D = get_node("%main_character")
onready var floorTexture : TextureRect = get_node("Floor")
onready var outboundArea : TileMap = get_node("YSort/OutboundBGTileMap")

onready var mainTheme : Dictionary = get_node("/root/Global").MAIN_THEME

# Called when the node enters the scene tree for the first time.
func _ready():
	setLevelColor()
	setCameraBound()

 
func setLevelColor():
	$Floor.modulate = mainTheme['summer'].level.floor
	$YSort/OutboundBGTileMap.modulate = mainTheme['summer'].level.outbound_area
	$YSort/WallBGTileMap.modulate = mainTheme['summer'].level.wall
	$YSort/Door.modulate = mainTheme['summer'].level.door
	$YSort/Desk.modulate = mainTheme['summer'].level.desk

func setCameraBound():
	camera.limit_left = - 100
	camera.limit_top = - 100 - 128
	camera.limit_bottom = floorTexture.rect_size.y + 100
	camera.limit_right = floorTexture.rect_size.x + 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	camera.position = mainCharacter.position
