class_name MainMenu
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/StartButton as Button
@onready var options = $MarginContainer/HBoxContainer/VBoxContainer/Options as Button
@onready var save_game = $MarginContainer/HBoxContainer/VBoxContainer/SaveGame as Button
@onready var quit_game = $MarginContainer/HBoxContainer/VBoxContainer/QuitGame as Button
@onready var options_menu = $OptionsMenu as OptionsMenu
@onready var margin_container = $MarginContainer as MarginContainer

@onready var start_level = preload("res://Scenes/playground.tscn") as PackedScene

func _ready():
	handle_connecting_signals()

func handle_connecting_signals() ->void:
	start_button.button_down.connect(on_start_pressed)
	options.button_down.connect(on_options_pressed)
	save_game.button_down.connect(on_save_pressed)
	quit_game.button_down.connect(on_exit_pressed)
	options_menu.exit_options_menu.connect(on_exit_pressed_menu)

func on_start_pressed() ->void:
	get_tree().change_scene_to_packed(start_level)

func on_options_pressed() ->void:
	margin_container.visible = false
	options_menu.visible = true

func on_save_pressed() ->void:
	pass	

func on_exit_pressed() ->void:
	get_tree().quit()

func on_exit_pressed_menu() ->void:
	margin_container.visible = true
	options_menu.visible = false
