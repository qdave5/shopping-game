extends Node2D


var main_level : PackedScene = preload("res://scenes/worlds/MainLevel.tscn")

onready var main_background : Sprite = get_node("MainBackground")
onready var play_button : Button = get_node("PlayButton")

# Called when the node enters the scene tree for the first time.
func _ready():
	main_background.modulate =get_node("/root/Global").MAIN_THEME['summer'].palette1
	play_button.modulate =get_node("/root/Global").MAIN_THEME['summer'].palette3


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene_to(main_level)
	pass # Replace with function body.
