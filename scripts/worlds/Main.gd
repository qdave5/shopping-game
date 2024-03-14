extends Node2D


var main_level : PackedScene = load("res://scenes/worlds/MainLevel.tscn")

onready var mainBackground : Sprite = get_node("MainBackground")
onready var playButton : Button = get_node("PlayButton")

# Called when the node enters the scene tree for the first time.
func _ready():
	mainBackground.modulate = get_node("/root/Global").MAIN_THEME['summer'].palette1
	playButton.modulate = get_node("/root/Global").MAIN_THEME['summer'].palette3
