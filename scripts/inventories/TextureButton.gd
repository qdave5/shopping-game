extends TextureButton

onready var mainColor = get_node("/root/Global").MAIN_COLOR
onready var eraseColor = get_node("/root/Global").eraseColor
var mouseColor : MouseColor = preload("res://resources/MouseColor.tres")

var lastColor = "red"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_TextureButton_pressed():
	if mouseColor.color != eraseColor:
		lastColor = mouseColor.color
		mouseColor.setColor(eraseColor)
		$".".modulate = mainColor.danger
	else:
		mouseColor.setColor(lastColor)
		$".".modulate = mainColor.white

