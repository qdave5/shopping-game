extends KinematicBody2D

onready var playerSprite : Position2D = get_node("Position2D")
onready var animationPlayer : AnimationPlayer = get_node("AnimationPlayer")

onready var globalVariables : Node = get_node("/root/Global")

var velocity : Vector2 = Vector2()
var direction : Vector2 = Vector2.ZERO

var DEFAULT_SPEED = 400
var SPRINTING_SPEED = 700
var speed : int = 400

var stamina : int = 100
var isSprint : bool = false

# -----------------------------------------------------------------------------------

# Called when the node enters the scene tree for the first time.
func _ready():
	colorCharacterBodyParts()

func colorCharacterBodyParts():
	# skin
	$Position2D/Face/Face.modulate = globalVariables.skinColor
	$Position2D/RightHand/RightHand.modulate = globalVariables.skinColor
	$Position2D/LeftHand/LeftHand.modulate = globalVariables.skinColor
	
	# hair
	$Position2D/FrontHair.modulate = globalVariables.hairColor
	$Position2D/BackHair.modulate = globalVariables.hairColor
	
	# cloth
	$Position2D/RightArm.modulate = globalVariables.clothColor
	$Position2D/LeftArm.modulate = globalVariables.clothColor
	$Position2D/Body/UpperBody.modulate = globalVariables.clothColor
	
	# leggins
	$Position2D/RightLeg.modulate = globalVariables.legginsColor
	$Position2D/LeftLeg.modulate = globalVariables.legginsColor
	$Position2D/Body/LowerBody.modulate = globalVariables.clothColor
	
	# shoes
	$Position2D/RightShoe/RightShoe.modulate = globalVariables.shoesColor
	$Position2D/LeftShoe/LeftShoe.modulate = globalVariables.shoesColor

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	get_input()
	update_animation()
	velocity = move_and_slide(direction * speed)

func get_input():
	if Input.is_action_pressed("ui_sprint") and stamina > 0:
		stamina -= 1
		speed = SPRINTING_SPEED
	else:
		speed = DEFAULT_SPEED

func update_animation():
	if Input.is_action_pressed("ui_left"):
		playerSprite.scale.x = -1
	if Input.is_action_pressed("ui_right"):
		playerSprite.scale.x = 1
	
	if velocity == Vector2.ZERO:
		animationPlayer.play("idle")
	else:
		if isSprint:
			animationPlayer.play("run")
		else:
			animationPlayer.play("walk")
