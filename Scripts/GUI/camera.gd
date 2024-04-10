extends Camera2D

@export var player: CharacterBody2D
@export var tilemap: TileMap

func _ready():
	var map_rect = tilemap.get_used_rect()
	var tile_size = 32
	var world_size = map_rect.size * tile_size

	limit_right = world_size.x/2
	limit_bottom = world_size.y/2


func _process(_delta):
	position = player.position
