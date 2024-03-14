extends Control


onready var globalTheme : Dictionary = get_node("/root/Global").MAIN_THEME

var worldLevel = load("res://resources/WorldLevel.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	$".".modulate = globalTheme['summer'].palette2
	$ColorRect/Label.text = "Day " + String(worldLevel.level)
	$AnimationPlayer.play("play")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
