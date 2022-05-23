extends "res://scripts/CityBuilder/TechTreeItems/TechTreeItem.gd"

func item_effect():
	$"/root/Node2D/CanvasLayer/TabContainer/Output/CookingPopUp/CookingSliders/StoveType/".select(1)
	$"/root/Node2D/CanvasLayer/TabContainer/Output/CookingPopUp/CookingSliders/StoveType/".emit_signal("item_selected", 1)
	
