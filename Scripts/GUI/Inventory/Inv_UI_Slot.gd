extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/Item_Display

# update the visibility of the item visual when the slot contains an item
func update(item: InvItem):
	if(!item):
		item_visual.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = item.texture

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
