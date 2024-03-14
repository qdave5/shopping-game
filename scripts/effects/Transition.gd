extends Control


export var animation : String = "start"

onready var animationPlayer : AnimationPlayer = get_node("AnimationPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	animationPlayer.play(animation + "_transition_position")

func playAnimation():
	print("runanimation")
	animationPlayer.play(animation + "_transition")
	yield(get_tree().create_timer(1.5), "timeout")
	print("after yield")
