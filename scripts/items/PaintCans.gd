extends StaticBody2D

onready var globalVar : Node = get_node("/root/Global")

onready var paintColors : Dictionary = {
	'red': get_node("Position2D/RedPaintCan"),
	'yellow': get_node("Position2D/YellowPaintCan"),
	'blue': get_node("Position2D/BluePaintCan")
}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PaintCansSelectionArea_area_entered(area):
	pass


func _on_PaintCansSelectionArea_area_exited(area):
	if area.name == "SelectArea":
		get_tree().call_group("MainUI", "closePaintContainer")
