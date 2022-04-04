extends CPUParticles2D

var CO2emissions0 = 42.1/2
var CH4emissions0 = 0.359


func _on_TotalSlider_value_changed(value):
	var scale = value/70.0
	var CO2emissions = CO2emissions0*scale
	var CH4emissions = CH4emissions0*scale
	self.amount = 1 + int(CO2emissions)
	get_node("CH4Particles2D").amount = 1 + int(CH4emissions*30.0)
	if (CO2emissions == 0.0): 
		self.emitting = false
		get_node("CH4Particles2D").emitting = false
	else: 
		self.emitting = true
		get_node("CH4Particles2D").emitting = true
