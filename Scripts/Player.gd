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
	if Input.is_action_pressed("ui_right"):
		_animation_player.play("WalkRight")
	else:
		_animation_player.stop()
		
	if Input.is_action_pressed("ui_left"):
		_animation_player.play("WalkLeft")
	else:
		_animation_player.stop()
		
	if Input.is_action_pressed("ui_up"):
		_animation_player.play("WalkUp")
	else:
		_animation_player.stop()
		
	if Input.is_action_pressed("ui_down"):
		_animation_player.play("WalkDown")
	else:
		_animation_player.stop()
