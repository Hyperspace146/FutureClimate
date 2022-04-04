extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var leng = (get_node("../../PercapenergySlider").value)
	self.rect_size.x = 50.0*leng/1000.0
	pass
