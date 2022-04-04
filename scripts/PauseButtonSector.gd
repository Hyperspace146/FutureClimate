extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("../ElectricityParticles2D").amount=get_node("../ElectricityParticles2D").amount
	get_node("../IndustryParticles2D").amount=get_node("../IndustryParticles2D").amount
	get_node("../TransportParticles2D").amount=get_node("../TransportParticles2D").amount
	get_node("../BuildingsParticles2D").amount=get_node("../BuildingsParticles2D").amount
	get_node("../WasteParticles2D").amount=get_node("../WasteParticles2D").amount
	get_node("../AgricultureParticles2D").amount=get_node("../AgricultureParticles2D").amount
	get_node("../BuildingsParticles2D/SulfateParticles2D").amount = get_node("../BuildingsParticles2D/SulfateParticles2D").amount
	get_node("../BuildingsParticles2D/CH4Particles2D3").amount = get_node("../BuildingsParticles2D/CH4Particles2D3").amount
	get_node("../AgricultureParticles2D/CH4Particles2D").amount=get_node("../AgricultureParticles2D/CH4Particles2D").amount
	get_node("../AgricultureParticles2D/N2OParticles2D").amount=get_node("../AgricultureParticles2D/N2OParticles2D").amount
	get_node("../AgricultureParticles2D/SulfateParticles2D").amount=get_node("../AgricultureParticles2D/SulfateParticles2D").amount
	get_node("../TransportParticles2D/SulfateParticles2D").amount=get_node("../TransportParticles2D/SulfateParticles2D").amount
	get_node("../IndustryParticles2D/N2OParticles2D").amount=get_node("../IndustryParticles2D/N2OParticles2D").amount
	get_node("../IndustryParticles2D/SulfateParticles2D").amount=get_node("../IndustryParticles2D/SulfateParticles2D").amount
	get_node("../ElectricityParticles2D/CH4Particles2D").amount=get_node("../ElectricityParticles2D/CH4Particles2D").amount
	get_node("../ElectricityParticles2D/SulfateParticles2D").amount=get_node("../ElectricityParticles2D/SulfateParticles2D").amount
	get_tree().paused = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PauseButton_pressed():
	if get_tree().paused == false: 
		get_node("../ElectricityParticles2D").amount=get_node("../ElectricityParticles2D").amount
		get_node("../IndustryParticles2D").amount=get_node("../IndustryParticles2D").amount
		get_node("../TransportParticles2D").amount=get_node("../TransportParticles2D").amount
		get_node("../BuildingsParticles2D").amount=get_node("../BuildingsParticles2D").amount
		get_node("../WasteParticles2D").amount=get_node("../WasteParticles2D").amount
		get_node("../AgricultureParticles2D").amount=get_node("../AgricultureParticles2D").amount
		get_node("../BuildingsParticles2D/SulfateParticles2D").amount = get_node("../BuildingsParticles2D/SulfateParticles2D").amount
		get_node("../BuildingsParticles2D/CH4Particles2D3").amount = get_node("../BuildingsParticles2D/CH4Particles2D3").amount
		get_node("../AgricultureParticles2D/CH4Particles2D").amount=get_node("../AgricultureParticles2D/CH4Particles2D").amount
		get_node("../AgricultureParticles2D/N2OParticles2D").amount=get_node("../AgricultureParticles2D/N2OParticles2D").amount
		get_node("../AgricultureParticles2D/SulfateParticles2D").amount=get_node("../AgricultureParticles2D/SulfateParticles2D").amount
		get_node("../TransportParticles2D/SulfateParticles2D").amount=get_node("../TransportParticles2D/SulfateParticles2D").amount
		get_node("../IndustryParticles2D/N2OParticles2D").amount=get_node("../IndustryParticles2D/N2OParticles2D").amount
		get_node("../IndustryParticles2D/SulfateParticles2D").amount=get_node("../IndustryParticles2D/SulfateParticles2D").amount
		get_node("../ElectricityParticles2D/CH4Particles2D").amount=get_node("../ElectricityParticles2D/CH4Particles2D").amount
		get_node("../ElectricityParticles2D/SulfateParticles2D").amount=get_node("../ElectricityParticles2D/SulfateParticles2D").amount
		get_tree().paused = true
	else : 
		.get_parent().get_node("HowToPlay").hide()
		get_tree().paused = false
