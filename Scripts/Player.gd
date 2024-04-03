extends CharacterBody2D

@onready var animation_tree = $animation_tree
@onready var animation_state = animation_tree.get("parameters/playback")
 
var input_movement = Vector2.ZERO
var speed = 140

func _process(delta):
	move()

func move():
	input_movement = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if input_movement != Vector2.ZERO:
		animation_tree.set("parameters/Idle/blend_position", input_movement)
		animation_tree.set("parameters/Walk/blend_position", input_movement)
		
		animation_state.travel("Walk")
		
		velocity = input_movement * speed
	
	if input_movement == Vector2.ZERO:
		animation_state.travel("Idle")
		velocity = Vector2.ZERO
	
	move_and_slide()
