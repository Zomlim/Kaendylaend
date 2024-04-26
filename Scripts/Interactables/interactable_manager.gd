extends Node

@onready var player = $/root/playground/Player
var interactables_on_scene: Array[Node]
var tooltip: String
var tooltip_style = LabelSettings.new()

var unhandled_input = false
var is_active = false
var block_movement = false
var was_in_range = false # tracks whether any interactable was in player range last frame
var is_in_range = false # tracks whether any interactable is currently in player range
var object_in_range: StaticBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	create_label_settings()
	create_tooltip_text()
	set_labels()
	interactables_on_scene = get_children()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	check_range()
	check_input()
	handle_input()

func create_label_settings():
	tooltip_style.font_color = Color(1, 1, 1, 1)
	tooltip_style.outline_color = Color(0.2, 0.2, 0.2, 0.9)
	tooltip_style.outline_size = 3
	tooltip_style.font_size = 8
	

func create_tooltip_text():
	var keys = ""
	var inputKeys = InputMap.action_get_events("interact")
	for key in inputKeys:
		keys = keys + '[' + key.as_text()[0] + ']'
	tooltip = keys + " to interact"

func set_labels():
	for interactable in interactables_on_scene:
		interactable.label.text = tooltip
		interactable.label.label_settings = tooltip_style
		

# checks whether an object is in range
func check_range():
	if is_in_range:
		# check if the object that was in range last frame is still in range
		if not object_in_range.interaction_area.overlaps_body(player):
			is_in_range = false
			was_in_range = true
		else:
			was_in_range = true
	else:
		# otherwise check all objects if any is in range
		for object in interactables_on_scene:
			if object.interaction_area.overlaps_body(player):
				object_in_range = object
				is_in_range = true
				continue
		was_in_range = false

# checks whether there is an input to be handled
func check_input():
	if is_in_range:
		if Input.is_action_just_pressed("interact"):
			unhandled_input = true
	else:
		unhandled_input = false

# handles input and movement
func handle_input():
	# player has just entered range
	if is_in_range and not was_in_range:
		object_in_range.enter()
	# player has just left range
	if was_in_range and not is_in_range:
		object_in_range.leave()
	# player presses button while in range
	if unhandled_input:
		if not is_active:
			object_in_range.activate()
			is_active = true
			if object_in_range.active_blocks_movement:
				block_movement = true
		else:
			object_in_range.deactivate()
			is_active = false
			block_movement = false
		unhandled_input = false
