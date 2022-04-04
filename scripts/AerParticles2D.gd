extends CPUParticles2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Aeremissions0 = 2.5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ShortLivedSlider_value_changed(value):
	var Aeremissions = Aeremissions0/70.0*get_node("../Sliders/ShortLivedSlider").value
	self.amount = 1 + int(Aeremissions*10.0)
	if (Aeremissions == 0.0): 
		self.emitting = false
	else: 
		self.emitting = true
