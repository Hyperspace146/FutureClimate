extends CPUParticles2D

var CO2emissions0 = 42.1/2
var N2Oemissions0 = 0.0104
var CO2fromIndustry = 0.23
var N2OfromIndustry = 0.18
var SulfatesfromIndustry = 0.38

func _on_IndustrySlider_value_changed(value):
	var IndustryCO2emissions = CO2emissions0*CO2fromIndustry/70.0*get_node("../Sliders/IndustrySlider").value
	var IndustryN2Oemissions = N2Oemissions0*N2OfromIndustry/70.0*get_node("../Sliders/IndustrySlider").value
	var IndustrySulfateemissions = SulfatesfromIndustry/70.0*get_node("../Sliders/IndustrySlider").value
	self.amount = 1 + int(IndustryCO2emissions)
	get_node("N2OParticles2D").amount = 1 + int(IndustryN2Oemissions*300.0)
	get_node("SulfateParticles2D").amount = 1 + int(IndustrySulfateemissions*30.0)
	if (IndustryCO2emissions == 0.0): 
		self.emitting = false
		get_node("N2OParticles2D").emitting = false
		get_node("SulfateParticles2D").emitting = false
	else: 
		self.emitting = true
		get_node("N2OParticles2D").emitting = true
		get_node("SulfateParticles2D").emitting = true
