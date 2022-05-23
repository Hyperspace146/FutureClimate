extends Label

export var energy_label_text = "Energy: "
export var energy_income = 6000  # Income gained at the end of the turn
export var energy = 0  # Current energy

func reset_energy():
	print("energy reset")
	energy = energy_income - $"/root/Node2D/CanvasLayer/TabContainer/Output".power_total
	print("total power spent: ", $"/root/Node2D/CanvasLayer/TabContainer/Output".power_total)
	if energy < 0:
		print("You lose! You went bankrupt on energy.")
	_update_energy_label()
	
func spend_energy(amount):
	if amount > energy:
		print("Not enough money to spend ", amount)
		return false
	print("spent ", amount)
	energy -= amount
	_update_energy_label()
	return true


func _ready():
	energy = energy_income
	_update_energy_label()
	
func _update_energy_label():
	text = energy_label_text + ("%d" % energy)

