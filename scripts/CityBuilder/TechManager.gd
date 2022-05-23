extends Control

var _selected_tech  # currently selected tech

func _select_tech(tech):  # parameter is the tech node with TechTreeItem script
	_selected_tech = tech
	_set_tooltip(tech.tooltip + " Cost: " + str(tech.cost))
	

func _purchase_tech():
	if _selected_tech == null:
		return
	
	var purchase_successful = $"/root/Node2D/CanvasLayer/TabContainer/City/VBoxContainer/WealthPanel/WealthLabel".spend_wealth(_selected_tech.cost)
	print(purchase_successful)
	if not purchase_successful:
		_set_tooltip("Not enough funds.")
		return false
	_selected_tech._unlock_children()
	_selected_tech.disabled = true
	_selected_tech = null


func _set_tooltip(tooltip):
	$"TechPanel/TooltipPanel/Tooltip".text = tooltip
	
