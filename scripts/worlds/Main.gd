extends Control


var main_level : PackedScene = load("res://scenes/worlds/MainLevel.tscn")

onready var mainBackground : Node = get_node(".")
onready var playButton : Button = get_node("%PlayButton")

# Called when the node enters the scene tree for the first time.
func _ready():
	mainBackground.color = get_node("/root/Global").MAIN_THEME['summer'].palette1
	playButton.modulate = get_node("/root/Global").MAIN_THEME['summer'].palette3


func _on_PlayButton_pressed():
	#$Transition.playAnimation()
	pass
