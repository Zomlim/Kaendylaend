extends Control

@onready var option_button = $HBoxContainer/OptionButton as OptionButton

const window_mode_array : Array[String] =[
	"Full-Screen",
	"Window Mode",
	"Borderless Window",
	"Borderless Full-Screen",
]

func _ready():
	add_window_mode_items()
	option_button.item.selected.connect(on_window_mode_selected)

func add_window_mode_items() ->void:
	for window_mode in window_mode_array:
		option_button.add_item(window_mode)

func on_window_mode_selected(index : int) ->void:
	match index:
		0: #Fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		1: #Window Mode
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		2: #Borderless Window
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		3: #Borderless Fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
