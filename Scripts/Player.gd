extends CharacterBody2D

@onready var _animation_player = $AnimationPlayer
@export var speed = 140


func _physics_process(_delta):
	get_input()
	move_and_slide()
	
func _process(_delta):
	animate()


func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed

func animate():
	# play each animation; to change, the animation gets overridden
	# elif is required so an animation still plays when walking diagonal (ie two keys pressed simultaneously)
	# order applies priorities from highest to lowest
	if Input.is_action_pressed("ui_down"):
		_animation_player.play("WalkDown")
	elif Input.is_action_pressed("ui_up"):
		_animation_player.play("WalkUp")	
	elif Input.is_action_pressed("ui_right"):
		_animation_player.play("WalkRight")
	elif Input.is_action_pressed("ui_left"):
		_animation_player.play("WalkLeft")
		
	

	# if no key triggering any animation is pressed, stop the animation
	if not (Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down")):
		_animation_player.stop()
