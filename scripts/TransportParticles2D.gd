extends CPUParticles2D

var CO2emissions0 = 42.1
var CO2fromTransportation = 0.19
var SulfatesfromTransportation = 0.10


func _on_TransportationSlider_value_changed(value):
	var TransportationCO2emissions = CO2emissions0*CO2fromTransportation/70.0*get_node("../Sliders/TransportationSlider").value
	var TransportationSulfateemissions = SulfatesfromTransportation/70.0*get_node("../Sliders/TransportationSlider").value
	self.amount = 1 + int(TransportationCO2emissions)
	get_node("SulfateParticles2D").amount = 1 + int(TransportationSulfateemissions*30.0)
	if (TransportationCO2emissions == 0.0): 
		self.emitting = false
		get_node("SulfateParticles2D").emitting = false
	else: 
		self.emitting = true
		get_node("SulfateParticles2D").emitting = true
