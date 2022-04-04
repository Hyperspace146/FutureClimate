extends CPUParticles2D

var CO2emissions0 = 42.1/2
var CH4emissions0 = 0.359

var CO2fromElectricity = 0.40
var CH4fromElectricity = 0.40
var SulfatesfromElectricity = 0.42

func _on_ElectricitySlider_value_changed(value):
	var ElectricityCO2emissions = CO2emissions0*CO2fromElectricity/70.0*get_node("../Sliders/ElectricitySlider").value
	var ElectricityCH4emissions = CH4emissions0*CH4fromElectricity/70.0*get_node("../Sliders/ElectricitySlider").value
	var ElectricitySulfateemissions = SulfatesfromElectricity/70.0*get_node("../Sliders/ElectricitySlider").value
	self.amount = 1 + int(ElectricityCO2emissions)
	get_node("CH4Particles2D").amount = 1 + int(ElectricityCH4emissions*30.0)
	get_node("SulfateParticles2D").amount = 1 + int(ElectricitySulfateemissions*30.0)
	if (ElectricityCO2emissions == 0.0): 
		self.emitting = false
		get_node("CH4Particles2D").emitting = false
		get_node("SulfateParticles2D").emitting = false
	else: 
		self.emitting = true
		get_node("CH4Particles2D").emitting = true
		get_node("SulfateParticles2D").emitting = true
