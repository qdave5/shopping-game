extends Control


onready var mainColor = get_node("/root/Global").MAIN_COLOR
onready var eraseColor = get_node("/root/Global").eraseColor
onready var paintButton = get_node("%PaintButton")
onready var eraseButton = get_node("%EraseButton")
var mouseColor : MouseColor = preload("res://resources/MouseColor.tres")

var lastColor = "red"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	paintButton.modulate = mainColor[mouseColor.color]

func _on_EraseTextureButton_pressed():
	if mouseColor.color != eraseColor:
		lastColor = mouseColor.color
		mouseColor.setColor(eraseColor)
		eraseButton.modulate = mainColor.danger
		paintButton.modulate = mainColor.gray
	else:
		mouseColor.setColor(lastColor)
		eraseButton.modulate = mainColor.white
		paintButton.modulate = mainColor[lastColor]

