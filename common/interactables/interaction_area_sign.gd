extends Area2D

@onready var player = $/root/playground/Player
@onready var label = $/root/playground/sign/tooltip
@onready var text = $/root/playground/sign/sign_text

var player_was_in_range = false #saves last state

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	interact()
	pass


func interact():
	# player is in range
	if overlaps_body(player):
		# player just entered
		if not player_was_in_range:
			label.show()
		
		if Input.is_action_pressed("interact"):
			label.hide()
			text.show()
			
		player_was_in_range = true
	
	
	# player is out of range
	if not overlaps_body(player):
		label.hide()
		text.hide()
		player_was_in_range = false
	
