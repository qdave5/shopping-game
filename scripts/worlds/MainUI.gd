extends CanvasLayer


onready var animationTree : AnimationTree = get_node("AnimationTree")
var animationTransitionMap : Dictionary = {
	'open': 0,
	'close': 1,
	'reset': 2,
}

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
			animationTree.set("parameters/InventoryTransition/current", animationTransitionMap.close)
		else:
			animationTree.set("parameters/InventoryTransition/current", animationTransitionMap.open)
		toggleIsInventoryOpen()
	if Input.is_action_just_pressed("ui_open_shoppinglist"):
		if isShoppingListOpen:
			animationTree.set("parameters/ShoppingListTransition/current", animationTransitionMap.close)
		else:
			animationTree.set("parameters/ShoppingListTransition/current", animationTransitionMap.open)
		toggleIsShoppingListOpen()

func openPaintContainer():
	if not isPaintOpen:
		animationTree.set("parameters/PaintColorTransition/current", animationTransitionMap.open)
		toggleIsPaintOpen()
	else:
		closePaintContainer()

func closePaintContainer():
	animationTree.set("parameters/PaintColorTransition/current", animationTransitionMap.close)
	toggleIsPaintOpen()
