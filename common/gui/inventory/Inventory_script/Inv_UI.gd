extends Control

class_name inv_ui

@onready var inv: inv = load("res://common/gui/inventory/Inventory_script/PlayerInv.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var is_open = false

# Called when the node enters the scene tree for the first time.
func _ready():
	update_slots()
	close()

# update each slot contained in the preloaded PlayerInventory 
func update_slots():
	for i in range(min(inv.items.size(), slots.size())):
		slots[i].update(inv.items[i])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("e"):
		if(is_open):
			close()
		else:
			open()

# open the inventory
func open():
	visible = true
	is_open = true

# close the inventory
func close():
	visible = false
	is_open = false
