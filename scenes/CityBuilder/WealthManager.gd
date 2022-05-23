extends Label

export var wealth_label_text = "Wealth: "
export var turn_income = 1000  # Income gained at the end of the turn
export var wealth = 0  # Current wealth

func gain_income():
	print("income gained")
	wealth += turn_income
	_update_wealth_label()
	
func spend_wealth(amount):
	if amount > wealth:
		print("Not enough money to spend ", amount)
		return false
	print("spent ", amount)
	wealth -= amount
	_update_wealth_label()
	return true
	
func _ready():
	_update_wealth_label()
	
func _update_wealth_label():
	text = wealth_label_text + str(wealth)
