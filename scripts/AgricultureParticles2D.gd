extends CPUParticles2D

var CO2emissions0 = 42.1
var CH4emissions0 = 0.359
var N2Oemissions0 = 0.0104
var CO2fromAgriculture = 0.10
#var CH4fromAgriculture = 0.40
#ag and waste
var CH4fromAgriculture = 0.57
var N2OfromAgriculture = 0.82
var SulfatesfromAgriculture = 0.03

func _on_AgricultureSlider_value_changed(value):
	var AgricultureCO2emissions = CO2emissions0*CO2fromAgriculture/70.0*get_node("../Sliders/AgricultureSlider").value
	var AgricultureCH4emissions = CH4emissions0*CH4fromAgriculture/70.0*get_node("../Sliders/AgricultureSlider").value
	var AgricultureN2Oemissions = N2Oemissions0*N2OfromAgriculture/70.0*get_node("../Sliders/AgricultureSlider").value
	var AgricultureSulfateemissions = SulfatesfromAgriculture/70.0*get_node("../Sliders/AgricultureSlider").value
	self.amount = 1 + int(AgricultureCO2emissions)
	get_node("CH4Particles2D").amount= 1 + int(AgricultureCH4emissions*30.0)
	get_node("N2OParticles2D").amount= 1 + int(AgricultureN2Oemissions*300.0)
	get_node("SulfateParticles2D").amount= 1 + int(AgricultureSulfateemissions*30.0)
	if (AgricultureCO2emissions == 0.0): 
		self.emitting = false
		get_node("CH4Particles2D").emitting = false
		get_node("N2OParticles2D").emitting = false
		get_node("SulfateParticles2D").emitting = false
	else: 
		self.emitting = true
		get_node("CH4Particles2D").emitting = true
		get_node("N2OParticles2D").emitting = true
		get_node("SulfateParticles2D").emitting = true
