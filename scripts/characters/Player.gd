extends KinematicBody2D

var rng = RandomNumberGenerator.new()

onready var playerSprite : Position2D = get_node("Position2D")
onready var animationPlayer : AnimationPlayer = get_node("AnimationPlayer")
onready var animationTree : AnimationTree = get_node("AnimationTree")
onready var selectArea : Area2D = get_node("SelectArea")

onready var characterColor : Dictionary = get_node("/root/Global").charactersColor.main_character
onready var themeColor : Dictionary = get_node("/root/Global").MAIN_THEME

var blinkTime : float = 2
var currentAnimation : String = "idle"
var animationTransitionMap : Dictionary = {
	'idle': 0,
	'walk': 1,
	'run': 2,
}

var velocity : Vector2 = Vector2()
var direction : Vector2 = Vector2.ZERO

var DEFAULT_SPEED = 300
var SPRINTING_SPEED = 600
var speed : int

var MAX_STAMINA = 100
var stamina : int = 100
var isSprint : bool = false

# -----------------------------------------------------------------------------------

# Called when the node enters the scene tree for the first time.
func _ready():
	setCharacterBodyPartsColor()

func setCharacterBodyPartsColor():
	# skin
	$Position2D/Face/Face.modulate = characterColor.skinColor
	$Position2D/RightHand/RightHand.modulate = characterColor.skinColor
	$Position2D/LeftHand/LeftHand.modulate = characterColor.skinColor
	
	# hair
	$Position2D/FrontHair.modulate = characterColor.hairColor
	$Position2D/BackHair.modulate = characterColor.hairColor
	
	# cloth
	$Position2D/RightArm.modulate = characterColor.clothColor
	$Position2D/LeftArm.modulate = characterColor.clothColor
	$Position2D/Body/UpperBody.modulate = characterColor.clothColor
	
	# leggins
	$Position2D/RightLeg.modulate = characterColor.legginsColor
	$Position2D/LeftLeg.modulate = characterColor.legginsColor
	$Position2D/Body/LowerBody.modulate = characterColor.clothColor
	
	# shoes
	$Position2D/RightShoe/RightShoe.modulate = characterColor.shoesColor
	$Position2D/LeftShoe/LeftShoe.modulate = characterColor.shoesColor
	
	#shadow
	$Position2D/LeftHand.modulate = themeColor['summer'].shadow
	$Position2D/LeftShoe.modulate = themeColor['summer'].shadow
	$Position2D/LeftArm/Shadow.modulate = themeColor['summer'].shadow
	$Position2D/LeftLeg/Shadow.modulate = themeColor['summer'].shadow

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(_delta):
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
	
	if Input.is_action_just_pressed("ui_interact"):
		if selectArea.get_overlapping_areas().size() > 0 && selectArea.get_overlapping_bodies().size() > 0:
			if selectArea.get_overlapping_areas()[0].name == "ShelfSelectionArea":
				selectArea.get_overlapping_bodies()[0].takeItem()
				print("ShelfSelectionArea")
			elif selectArea.get_overlapping_areas()[0].name == "PaintCansSelectionArea":
				get_tree().call_group("MainUI", "openPaintContainer")
				print("PaintCansSelectionArea")
			elif selectArea.get_overlapping_areas()[0].name == "DeskSelectionArea":
				selectArea.get_overlapping_bodies()[0].storeItems()
				print("DeskSelectionArea")
			elif selectArea.get_overlapping_areas()[0].name == "DoorSelectionArea":
				selectArea.get_overlapping_bodies()[0].endLevel()
				print("DoorSelectionArea")

func update_animation():
	if (Time.get_ticks_msec() > blinkTime):
		doBlink()
		blinkTime = Time.get_ticks_msec() + (rng.randf_range(5, 8) * 1000)
	
	if direction.x < 0:
		playerSprite.scale.x = -1
	elif direction.x > 0:
		playerSprite.scale.x = 1
	
	if velocity == Vector2.ZERO:
		currentAnimation ="idle"
	else:
		if isSprint:
			currentAnimation = "run"
		else:
			currentAnimation = "walk"
	
	if animationTransitionMap[currentAnimation] != animationTree.get("parameters/state/current"):
		animationTree.set("parameters/state/current", animationTransitionMap[currentAnimation])

func doBlink():
	animationTree.set('parameters/blink/conditions/isBlink', true)

func stopBlink():
	animationTree.set('parameters/blink/conditions/isBlink', false)



func _on_StaminaTimer_timeout():
	_fillStamina(1)

func _fillStamina(newStamina):
	if stamina < MAX_STAMINA:
		stamina += newStamina
