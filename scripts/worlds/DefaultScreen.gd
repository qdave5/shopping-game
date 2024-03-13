extends ColorRect

onready var globalTheme : Dictionary = get_node("/root/Global").MAIN_THEME

func _ready():
	$".".modulate = globalTheme["summer"].palette1
	$CenterContainer/VBoxContainer/PlayButton.modulate = globalTheme["summer"].palette3
