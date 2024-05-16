extends Area2D

@onready var player = $/root/playground/Player
@onready var label = $/root/playground/chest/tooltip
@onready var text = $/root/playground/chest/text

var is_open = false # let player know when to block movement

var last_frame_had_input = false
var unhandled_input = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	handle_input()
	interact()
	pass


func handle_input():
	if Input.is_action_pressed("interact"):
		if not last_frame_had_input:
			unhandled_input = true
		last_frame_had_input = true
	else:
		last_frame_had_input = false
	
	# only register unhandled input if it happens while player is in range
	if not overlaps_body(player):
		unhandled_input = false
		last_frame_had_input = false


func interact():
	# player is in range
	if overlaps_body(player):
		if not is_open:
			label.show()
			text.hide()
		else:
			label.hide()
			text.show()
			
		if unhandled_input:
			if is_open:
				is_open = false
			else:
				is_open = true
			unhandled_input = false
	
	# player is out of range
	if not overlaps_body(player):
		label.hide()
		text.hide()
