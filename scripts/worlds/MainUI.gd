extends CanvasLayer

onready var mainTheme : Dictionary = get_node("/root/Global").MAIN_THEME

onready var audioStream : AudioStreamPlayer2D = get_node("FlipPaperAudio")

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
	$InventoryContainer/InventoryOpenButton.modulate = mainTheme['summer'].palette4
	$PaintColorContainer/Background.modulate = mainTheme['summer'].palette4
	$ShoppingListContainer/Background.modulate = mainTheme['summer'].palette1
	$ShoppingListContainer/ShoppingListOpenButton.modulate = mainTheme['summer'].palette1
	
	$HeaderContainer/StaminaBar.tint_under = mainTheme['summer'].palette4
	$HeaderContainer/StaminaBar.tint_progress = mainTheme['summer'].palette1
	$HeaderContainer/TimerBar.modulate = mainTheme['summer'].palette4


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_open_inventory"):
		toggleInventoryContainer()
	if Input.is_action_just_pressed("ui_open_shoppinglist"):
		toggleShoppingListContainer()
	if Input.is_action_just_pressed("ui_open_itemlist"):
		toggleItemListContainer()

func toggleInventoryContainer():
	if isInventoryOpen:
		animationTree.set("parameters/InventoryTransition/current", animationTransitionMap.close)
	else:
		animationTree.set("parameters/InventoryTransition/current", animationTransitionMap.open)
	toggleIsInventoryOpen()
	playAudioComponents()

func toggleShoppingListContainer():
	if isShoppingListOpen:
		animationTree.set("parameters/ShoppingListTransition/current", animationTransitionMap.close)
	else:
		animationTree.set("parameters/ShoppingListTransition/current", animationTransitionMap.open)
	toggleIsShoppingListOpen()
	playAudioComponents()

func toggleItemListContainer():
	if isItemListOpen:
		animationTree.set("parameters/ItemListTransition/current", animationTransitionMap.close)
	else:
		animationTree.set("parameters/ItemListTransition/current", animationTransitionMap.open)
	toggleIsItemListOpen()
	playAudioComponents()


func playAudioComponents():
	$AudioStreamPlayer2D.play(0.5)
	

func openPaintContainer():
	if not isPaintOpen:
		animationTree.set("parameters/PaintColorTransition/current", animationTransitionMap.open)
		toggleIsPaintOpen()
		if not isInventoryOpen:
			animationTree.set("parameters/InventoryTransition/current", animationTransitionMap.open)
			toggleIsInventoryOpen()
	else:
		closePaintContainer()

func closePaintContainer():
	animationTree.set("parameters/PaintColorTransition/current", animationTransitionMap.close)
	toggleIsPaintOpen()
	if isInventoryOpen:
		animationTree.set("parameters/InventoryTransition/current", animationTransitionMap.close)
		toggleIsInventoryOpen()


func _on_ItemListOpenButton_pressed():
	toggleItemListContainer()

func _on_ShoppingListOpenButton_pressed():
	toggleShoppingListContainer()

func _on_InventoryOpenButton_pressed():
	toggleInventoryContainer()
