extends "res://scripts/CityBuilder/Building.gd"

# Total amount of energy this building provides to buildings in its radius
export var max_energy_supply = 30

# Amount of energy currently available to be used by other buildings in radius
onready var energy_supply = max_energy_supply  

func init(tile_pos):
	.init(tile_pos)
	#get_node("/root/Node2D/BuildingGrid").iterate_over_radius(tile_pos, radius, \
		#funcref(self, "_link_with_other_EnergyBuilding"))


func _ready():
	btype = BuildingType.Energy

"""
func _link_with_other_EnergyBuilding(tile_pos):
	var tile_info = get_node("/root/Node2D/BuildingGrid").get_tile_info(tile_pos)
	for building in tile_info:
		if building.btype = BuildingType.Energy:
			
"""
