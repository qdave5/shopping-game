extends CenterContainer


onready var globalColor : Dictionary = get_node("/root/Global").MAIN_COLOR
var mouseColor = preload("res://resources/MouseColor.tres")

export var color : String = "red"

func _ready():
	$ColorRect.color = globalColor[color]

func _on_ColorRect_gui_input(_event):
	if Input.is_mouse_button_pressed(1):
		mouseColor.setColor(color)
		print(mouseColor)
