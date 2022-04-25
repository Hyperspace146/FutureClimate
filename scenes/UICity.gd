extends Control


#onready var powerSources = get_node("../../PowerSources")
var WIND = load("res://scenes/Windmill.tscn")
var SOLAR = load("res://scenes/Solar.tscn")
var NUCLEAR = load("res://scenes/Nuclear.tscn")


var slidersarray
#var totalVal = 100
#var greenEnergy = 50

var solarCount = 5
var windCount = 5
var nucCount = 5

#var mouse_in = false


# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#$ColorRect/VBoxContainer/ProgressBar2.value = GlobalVariables.GlobalTemp 



func _on_ElectricityLabel2_toggled(button_pressed):
	print("Green power button pressed")
	if button_pressed == true:
		$ColorRect/AnimationPlayer.play("GPower")
	else:
		$ColorRect/AnimationPlayer.play_backwards("GPower")
	pass # Replace with function body.
