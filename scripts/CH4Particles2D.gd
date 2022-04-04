extends CPUParticles2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var CH4emissions0 = 0.359

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CH4Slider_value_changed(value):
	var CH4emissions = CH4emissions0/70.0*get_node("../Sliders/CH4Slider").value
	self.amount = 1 + int(CH4emissions*10.0)
	if (CH4emissions == 0.0): 
		self.emitting = false
	else: 
		self.emitting = true
