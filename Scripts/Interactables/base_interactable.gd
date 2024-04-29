extends Node2D
# this is a template for any given interactable
# copy this to any script of an interactable and fill out functions as needed
# vars may be be added, but NOT REMOVED

# interaction range
@onready var interaction_area = $InteractionAreaSign
# text boxes belonging to this object
@onready var label = $tooltip
@onready var text = $sign_text

@export var active_blocks_movement = false # whether to block movement while interaction is active

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
	
# Called when player is in range and dismisses action
func deactivate():
	text.hide()
	label.show()
