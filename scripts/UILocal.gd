extends Control

onready var powerSources = get_node("../../PowerSources")
var WIND = load("res://scenes/Windmill.tscn")
var SOLAR = load("res://scenes/Solar.tscn")
var NUCLEAR = load("res://scenes/Nuclear.tscn")

onready var agr = get_node("Sliders/AgricultureSlider")
onready var slider1 = get_node("Sliders/ElectricitySlider")
onready var slider2 = get_node("Sliders/IndustrySlider")
onready var slider3 = get_node("Sliders/TransportationSlider")
onready var slider4 = get_node("Sliders/BuildingsSlider")
onready var slider5 = get_node("Sliders/AgricultureSlider")


var slidersarray
#var totalVal = 100
#var greenEnergy = 50

var solarCount = 5
var windCount = 5
var nucCount = 5

#var mouse_in = false


# Called when the node enters the scene tree for the first time.
func _ready():
	#totalVal = (slider1.value + slider2.value + slider3.value + slider4.value + slider5.value) / 350 * 100
	#print(totalVal)
	slidersarray = [slider1, slider2, slider3, slider4, slider5]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ProgressBar2.value = GlobalVariables.GlobalTemp 





func _on_Slider_changed():
	
	#Supply FF
	var FossilFuelPower = GlobalVariables.FFPower
	#Supply Green
	var GreenPower = GlobalVariables.solarPower + GlobalVariables.windPower + GlobalVariables.nuclearPower
	#Demand
	var leng = (get_node("../PercapenergySlider").value)
	var elecneeded = (get_node("../PercapenergySlider").value)/1000.0*7.0
	$DemandRect.rect_size.x = 50.0*leng/1000.0
	$ColorRect2.rect_size.x = 500.0*(GreenPower)/elecneeded
	$FossilRect.rect_size.x = 50.0*elecneeded/7.0
	
	$FossilRect.rect_size.y = FossilFuelPower/elecneeded * 50.0
	$ColorRect2.rect_size.y = elecneeded/7.0 * 50.0
	
	slider1.value = FossilFuelPower
	slider2.value = FossilFuelPower
	slider3.value = FossilFuelPower
	slider4.value = FossilFuelPower
	slider5.value = FossilFuelPower
	for slider in slidersarray:
		print(slider.value)
	
	#get_node("../../RichTextLabel").text = "Clean energy sources deliver " + str(panels) + " tera. \n" + "World demand can be met with " + str(elecneeded) + " tera\nof electricity.\n" + "The energy need is " + str(round(panels/elecneeded*100)) + "% satisfied \nby clean electricity"
	get_node("../TeraLabel").text = str(GreenPower) + " tera\nof clean \nelectricity\n\n" + str(round(GreenPower/elecneeded*100)) + "% of\ndemand\n(" + str(round(elecneeded)) + " tera)"







func _on_Nuclear_pressed():
	if nucCount > 0:
		var camPos
		var nuc = NUCLEAR.instance()
		camPos = get_node("../../PowerSources/TileMap/CamContainer").editor.get_global_position()
		powerSources.add_child(nuc)
		nuc.set_position(camPos + Vector2(140, 0))
		nucCount -= 1
		$ColorRect/VBoxContainer/Nuclear/TextureRect/Label.text = str(nucCount)
		print("solar array added, location: ", nuc.get_position())
	else:
		pass


func _on_Solar_pressed():
	if solarCount > 0:
		var camPos
		var solar = SOLAR.instance()
		camPos = get_node("../../PowerSources/TileMap/CamContainer").editor.get_global_position()
		powerSources.add_child(solar)
		solar.set_position(camPos + Vector2(125, 45))
		solarCount -= 1
		$ColorRect/VBoxContainer/Solar/TextureRect/Label.text = str(solarCount)
		print("solar array added, location: ", solar.get_position())
	else:
		pass


func _on_Wind_pressed():
	if windCount > 0:
		var camPos
		var wind = WIND.instance()
		camPos = get_node("../../PowerSources/TileMap/CamContainer").editor.get_global_position()
		powerSources.add_child(wind)
		wind.set_position(camPos + Vector2(136, 10))
		windCount -= 1
		$ColorRect/VBoxContainer/Wind/TextureRect2/Label.text = str(windCount)
		print("windmill added, location: ", wind.get_position())
	else:
		pass




func _on_ElectricityLabel_toggled(button_pressed):
	print("Green power button pressed")
	if button_pressed == true:
		$ColorRect/AnimationPlayer.play("GPower")
	else:
		$ColorRect/AnimationPlayer.play_backwards("GPower")


func _on_Agriculture_mouse_entered():
	agr.play("Grow")
func _on_Agriculture_mouse_exited():
	agr.stop()
	agr.frame = 0
