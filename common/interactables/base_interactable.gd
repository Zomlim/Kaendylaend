extends Node2D
# this is a template for any given interactable
# to make a new interactable:
# right click on this scene in the FileSystem section (bottom left)
# and create an Inherited Scene
# adjust as needed (ie change Sprite and hitboxes

# -------------------

# interaction range
@onready var interaction_area = $InteractionAreaSign
# text boxes belonging to this object
@onready var label = $tooltip
@onready var text = $sign_text

# set properties of the interactable
@export var interactable_properties = {
	"block_movement": false,
	"change_screen": false,
	"destroyable": false,
	"dialogue": true,
	"get_item": false,
	"moveable": false
}

# -------- functions --------

# Called when the node enters the scene tree for the first time.
func _ready():
	label.hide()
	text.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

# Called when player enters the range of this object
func enter():
	label.show()

# Called when player leaves range
func leave():
	label.hide()
	text.hide()

# Called when player is in range and interacts
func activate():
	label.hide()
	text.show()
	# get_item
	# move
	# change_screen
	
# Called when player is in range and dismisses action
func deactivate():
	text.hide()
	label.show()
