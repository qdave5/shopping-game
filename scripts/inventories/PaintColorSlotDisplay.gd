extends CenterContainer


onready var globalColor : Dictionary = get_node("/root/Global").MAIN_COLOR
var mouseColour = preload("res://resources/MouseColour.tres")

export var colour : String = "red"

func _ready():
	$ColorRect.color = globalColor[colour]

func _on_ColorRect_gui_input(event):
	if Input.is_mouse_button_pressed(1):
		mouseColour.setColour(colour)
		print(mouseColour)
