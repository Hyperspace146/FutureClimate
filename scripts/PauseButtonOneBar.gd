extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#Game should start paused
	yield(get_tree().create_timer(0.1), "timeout")
	get_node("../TotalParticles2D").amount = get_node("../TotalParticles2D").amount
	get_node("../TotalParticles2D/CH4Particles2D").amount = get_node("../TotalParticles2D/CH4Particles2D").amount
	get_tree().paused = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PauseButton_pressed():
	print("pause pressed")
	if get_tree().paused == false: 
		get_node("../TotalParticles2D").amount = get_node("../TotalParticles2D").amount
		get_node("../TotalParticles2D/CH4Particles2D").amount = get_node("../TotalParticles2D/CH4Particles2D").amount
		get_tree().paused = true
	else : 
		get_parent().get_node("HowToPlay").hide()
		get_tree().paused = false
