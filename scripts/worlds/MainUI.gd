extends CanvasLayer


onready var animationPlayer : AnimationPlayer = get_node("AnimationPlayer")

var isInventoryOpen : bool = false
func toggleIsInventoryOpen():
	isInventoryOpen = not isInventoryOpen

var isPaintOpen : bool = false
func toggleIsPaintOpen():
	isPaintOpen = not isPaintOpen

var isShoppingListOpen : bool = false
func toggleIsShoppingListOpen():
	isShoppingListOpen = not isShoppingListOpen

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_open_inventory"):
		if isInventoryOpen:
			animationPlayer.play("inventory_close")
		else:
			animationPlayer.play("inventory_open")
		toggleIsInventoryOpen()
	if Input.is_action_just_pressed("ui_open_shoppinglist"):
		if isShoppingListOpen:
			animationPlayer.play("shoppingList_close")
		else:
			animationPlayer.play("shoppingList_open")
		toggleIsShoppingListOpen()

func openPaintContainer():
	if not isPaintOpen:
		animationPlayer.play("paint_color_open")
		toggleIsPaintOpen()
	else:
		closePaintContainer()

func closePaintContainer():
	animationPlayer.play("paint_color_close")
	toggleIsPaintOpen()
