extends CPUParticles2D

var CO2emissions0 = 42.1
var CH4emissions0 = 0.359
var CO2fromBuildings = 0.08
var CH4fromBuildings = 0.03
var SulfatesfromBuildings = 0.07

func _on_BuildingsSlider_value_changed(value):
	var BuildingsCO2emissions = CO2emissions0*CO2fromBuildings/70.0*get_node("../Sliders/BuildingsSlider").value
	var BuildingsCH4emissions = CH4emissions0*CH4fromBuildings/70.0*get_node("../Sliders/BuildingsSlider").value
	var BuildingsSulfateemissions = SulfatesfromBuildings/70.0*get_node("../Sliders/BuildingsSlider").value
	self.amount = 1 + int(BuildingsCO2emissions)
	get_node("CH4Particles2D3").amount = 1 + int(BuildingsCH4emissions*30.0)
	get_node("SulfateParticles2D").amount = 1 + int(BuildingsSulfateemissions*30.0)
	if (BuildingsCO2emissions == 0.0): 
		self.emitting = false
		get_node("CH4Particles2D3").emitting = false
		get_node("SulfateParticles2D").emitting = false
	else: 
		self.emitting = true
		get_node("CH4Particles2D3").emitting = true
		get_node("SulfateParticles2D").emitting = true

