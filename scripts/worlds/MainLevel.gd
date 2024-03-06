extends Node2D

onready var camera : Camera2D = get_node("Camera2D")
onready var main_character : KinematicBody2D = get_node("%main_character")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	camera.position = main_character.position
