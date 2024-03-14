extends CanvasLayer

onready var mainTheme = get_node("/root/Global").MAIN_THEME

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

var isItemListOpen : bool = false
func toggleIsItemListOpen():
	isItemListOpen = not isItemListOpen

# Called when the node enters the scene tree for the first time.
func _ready():
	$InventoryContainer/Background.modulate = mainTheme['summer'].palette4
	$PaintColorContainer/Background.modulate = mainTheme['summer'].palette4
	$ShoppingListContainer/Background.modulate = mainTheme['summer'].palette1
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
	if Input.is_action_just_pressed("ui_open_itemlist"):
		if isItemListOpen:
			animationTree.set("parameters/ItemListTransition/current", animationTransitionMap.close)
		else:
			animationTree.set("parameters/ItemListTransition/current", animationTransitionMap.open)
		toggleIsItemListOpen()

func openPaintContainer():
	if not isPaintOpen:
		animationTree.set("parameters/PaintColorTransition/current", animationTransitionMap.open)
		toggleIsPaintOpen()
	else:
		closePaintContainer()

func closePaintContainer():
	animationTree.set("parameters/PaintColorTransition/current", animationTransitionMap.close)
	toggleIsPaintOpen()
