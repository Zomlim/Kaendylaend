class_name Main_menu
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/Start_button as Button
@onready var options_button = $MarginContainer/HBoxContainer/VBoxContainer/Options_button as Button
@onready var savegames_button = $MarginContainer/HBoxContainer/VBoxContainer/Savegames_button as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/Exit_button as Button
@onready var options_menu = $OptionsMenu as Options_menu
@onready var margin_container = $MarginContainer as MarginContainer

@onready var start_level = preload("res://Scenes/playground.tscn") as PackedScene

func _ready():
	handle_connecting_signals()

func handle_connecting_signals() ->void:
	start_button.button_down.connect(on_start_pressed)
	options_button.button_down.connect(on_options_pressed)
	savegames_button.button_down.connect(on_savegame_pressed)
	exit_button.button_down.connect(on_exit_pressed)
	options_menu.exit_options_menu.connect(on_exit_pressed_menu)

func on_start_pressed() ->void:
	get_tree().change_scene_to_packed(start_level)

func on_options_pressed() ->void:
	margin_container.visible = false
	options_menu.visible = true

func on_savegame_pressed() ->void:
	print("Savegame pressed")

func on_exit_pressed() ->void:
	get_tree().quit()

func on_exit_pressed_menu() ->void:
	margin_container.visible = true
	options_menu.visible = false
