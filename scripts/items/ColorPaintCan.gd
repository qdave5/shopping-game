extends StaticBody2D


onready var canColor : String = get_node("/root/Global").MAIN_THEME['summer'].palette4
export var paintColor : String = 'white'

# Called when the node enters the scene tree for the first time.
func _ready():
	setPaintCanColor()

func setPaintCanColor():
	$PaintCanSpritePersist.modulate = canColor
	$PaintCanSpriteColor.modulate = get_node("/root/Global").MAIN_COLOR[paintColor]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
