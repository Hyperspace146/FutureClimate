extends CPUParticles2D

var CH4fromWaste = 0.17
var CH4emissions0 = 0.359


func _on_WasteSlider_value_changed(value):
	var WasteCH4Emissions = CH4emissions0*CH4fromWaste/70.0*get_node("../Sliders/WasteSlider").value
	self.amount = 1 + int(WasteCH4Emissions*30.0)
	if (WasteCH4Emissions == 0.0): 
		self.emitting = false
	else: 
		self.emitting = true

