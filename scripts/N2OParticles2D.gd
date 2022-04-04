extends CPUParticles2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var N2Oemissions0 = 0.0104

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_N2OSlider_value_changed(value):
	var N2Oemissions = N2Oemissions0/70.0*get_node("../Sliders/N2OSlider").value
	self.amount = 1 + int(N2Oemissions*100.0)
	if (N2Oemissions == 0.0): 
		self.emitting = false
	else: 
		self.emitting = true
