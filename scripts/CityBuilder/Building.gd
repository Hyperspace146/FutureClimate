extends Node2D

enum BuildingType {Base, Energy, Productive}

export var radius = 5  # The radius of this building in tiles
export var btype = BuildingType.Base

var tile_pos # The x and y tile position of this building

onready var radius_highlight = preload("res://scenes/CityBuilder/TileHighlight.tscn")

func init(tile_pos):
	self.tile_pos = tile_pos
	get_node("/root/Node2D/BuildingGrid").iterate_over_radius(tile_pos, radius, funcref(self, "_init_radius_highlight"))
	

func _init_radius_highlight(tile_pos):
	var rh = radius_highlight.instance()
	add_child(rh)
	get_node("/root/Node2D/BuildingGrid").set_node_position_to_tile(rh, tile_pos)
	
