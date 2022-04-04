extends CPUParticles2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var CO2emissions0 = 42.1/2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CO2Slider_value_changed(value):
		var CO2emissions = CO2emissions0/70.0*get_node("../Sliders/CO2Slider").value
		self.amount = 1 + int(CO2emissions/3.0)
		if (CO2emissions == 0.0): 
			self.emitting = false
		else: 
			self.emitting = true
