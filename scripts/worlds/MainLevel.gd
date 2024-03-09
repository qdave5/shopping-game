extends Node2D

onready var camera : Camera2D = get_node("Camera2D")
onready var mainCharacter : KinematicBody2D = get_node("%main_character")
onready var floorTexture : TextureRect = get_node("Floor")

# Called when the node enters the scene tree for the first time.
func _ready():
	floorTexture.modulate = get_node("/root/Global").MAIN_THEME['summer'].palette2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	camera.position = mainCharacter.position
