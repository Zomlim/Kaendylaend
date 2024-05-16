class_name Hotkey_rebind_button
extends Control


@onready var label = $HBoxContainer/Label as Label
@onready var button = $HBoxContainer/Button as Button

@export var action_name : String = "ui_left"


func _ready():
	set_process_unhandled_key_input(false)
	set_action_name()
	set_text_for_key()

func set_action_name() ->void:
	label.text = "Unassigned"
	
	match action_name:
		"ui_left":
			label.text = "Move Left"
		"ui_right":
			label.text = "Move Right"
		"ui_up":
			label.text = "Move Up"
		"ui_down":
			label.text = "Move Down"
			
#		"Placeholder":
#			label.text = "Interact"
#		"Placeholder":
#			label.text = "Open Main Menu"
#		"Placeholder":
#			label.text = "Open Inventory"
#		"Placeholder":
#			label.text = "Open Map"
#		"Placeholder":
#			label.text = "Open Stats Menu"
#		"Placeholder":
#			label.text = "Quick Save"

func set_text_for_key() ->void:
	var action_events = InputMap.action_get_events(action_name)
	var action_event = action_events[0]
	var action_keycode = OS.get_keycode_string(action_event.physical_keycode)
	
	
	button.text = "%s" % action_keycode

func _on_button_toggled(toggled_on):
	if toggled_on:
		button.text = "Press any key..."
		set_process_unhandled_key_input(toggled_on)
		
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = false
				i.set_process_unhandled_key_input(false)
		
	else:
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = true
				i.set_process_unhandled_key_input(false)
				
		set_text_for_key()
		
func _unhandled_key_input(event):
	rebind_action_key(event)
	button.button_pressed = false

func rebind_action_key(event):
	var is_duplicate=false
	var action_event=event
	var action_keycode=OS.get_keycode_string(action_event.physical_keycode)
	
	for i in get_tree().get_nodes_in_group("hotkey_button"):
		if i.action_name!=self.action_name:
			if i.button.text=="%s" %action_keycode:
				is_duplicate=true
				break
	if not is_duplicate:
		InputMap.action_erase_events(action_name)
		InputMap.action_add_event(action_name,event)
		set_process_unhandled_key_input(false)
		set_text_for_key()
		set_action_name()
