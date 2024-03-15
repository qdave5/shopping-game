extends StaticBody2D


onready var globalColor : Dictionary = get_node("/root/Global").MAIN_COLOR

func _ready():
	$PlantColor.modulate = globalColor.green

