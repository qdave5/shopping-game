extends KinematicBody2D

var player_sprite : Position2D
var animation_player : AnimationPlayer

var velocity : Vector2 = Vector2()
var direction : Vector2 = Vector2.ZERO

var DEFAULT_SPEED = 400
var SPRINTING_SPEED = 700
var speed : int

var stamina : int = 100
var is_sprint : bool = false

# -----------------------------------------------------------------------------------

# Called when the node enters the scene tree for the first time.
func _ready():
	player_sprite = get_node("Position2D")
	animation_player = get_node("AnimationPlayer")

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
		player_sprite.scale.x = -1
	if Input.is_action_pressed("ui_right"):
		player_sprite.scale.x = 1
	
	if velocity == Vector2.ZERO:
		animation_player.play("idle")
	else:
		if is_sprint:
			animation_player.play("run")
		else:
			animation_player.play("walk")
