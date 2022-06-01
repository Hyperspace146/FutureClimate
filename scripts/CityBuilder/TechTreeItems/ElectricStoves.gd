extends "res://scripts/CityBuilder/TechTreeItems/TechTreeItem.gd"

func item_effect():
	$"/root/Node2D".find_node("StoveType").select(1)
	$"/root/Node2D".find_node("StoveType").emit_signal("item_selected", 1)
