extends Node2D


# Declare member variables here. Examples:
# var a = 2
# Initial values
var TYear = 2020.5
var co2 = 413.0
var ch4 = 1.874
var n2o = 0.333
# preindustrial
var co2pre = 277.0
var ch4pre = 0.722
var n2opre = 0.2720
# partitioning into 4 boxes
var co20 = 329.6
var co21 = 48.6
var co22 = 29.7
var co23 = 5.1
#timescales 
var co2time1 = 394.4
var co2time2 = 36.54
var co2time3 = 4.304
#note different than IPCC 12.4
var ch4time = 9.4
var n2otime = 121.0
#co2 fractions (adds to 1)
var co2frac0 = 0.2173
var co2frac1 = 0.2240
var co2frac2 = 0.2824
var co2frac3 = 0.2763
#radiative parameters
var a1 = -2.4e-7
var b1 = 7.2e-4
var c1 = -2.1e-4
var a2 = -8.0e-6
var b2 = 4.2e-6
var c2 = -4.9e-6
var a3 = -1.3e-6
var b3 = -8.2e-6

#surface and deep temperature change in 2019
var T0 = [1.1, 1.1, 1.1]
var Td0 = [0.3, 0.3, 0.3]

var C_s = 8.2#9.6
var C_d = 109.0#56.
var gamma = 0.67#0.8
var eps = 1.28#1.8
#3K equilibrium sensitivity for 4.0 W/m2 doubling sensitivity
var lambda_eq = [3.7/2.7, 3.7/3.4, 3.7/4.7]#3.44/4.5
#global carbon project 2019
var CO2emissions0 = 42.1
var CH4emissions0 = 0.359
var N2Oemissions0 = 0.0104
var CO2emissions = 42.1
var CH4emissions = 0.359
var N2Oemissions = 0.0104

var CO2North = 0.80
var CO2South = 0.20

#halocarbon emissions based erf
var fh = 0.0
var fh0 = 0.0
# aerosol forcing (-1.1) + tropospheric ozone not caused by methane (-0.9)
var fa0 = [-0.5,-1.0,-1.7] # three different sensitivities
var fa = [-0.5,-1.0,-1.7]
var fc = 2.15
# 0.54 + 0.07 strat H2O + 0.15 trop oz = 0.76, 
var fm = 0.76
var fn = 0.19
var F = [2.53, 2.53, 2.53]

var CO2fromElectricity = 0.40         # percentage of CO2 from ...
var CO2fromIndustry = 0.23
var CO2fromTransportation = 0.19
var CO2fromAgriculture = 0.10
var CO2fromBuildings = 0.08
var CH4fromElectricity = 0.40
var CH4fromAgriculture = 0.40
var CH4fromWaste = 0.17
var CH4fromBuildings = 0.03
var N2OfromAgriculture = 0.82
var N2OfromIndustry = 0.18
var SulfatesfromElectricity = 0.42
var SulfatesfromIndustry = 0.38
var SulfatesfromTransportation = 0.10
var SulfatesfromBuildings = 0.07
var SulfatesfromAgriculture = 0.03


var timer = 0 #Used to space out graph updates

onready var slider1 = get_node("CanvasLayer/UILocal/Sliders/ElectricitySlider")

onready var slider2 = get_node("CanvasLayer/UILocal/Sliders/IndustrySlider")
onready var slider3 = get_node("CanvasLayer/UILocal/Sliders/TransportationSlider")
onready var slider4 = get_node("CanvasLayer/UILocal/Sliders/BuildingsSlider")
onready var slider5 = get_node("CanvasLayer/UILocal/Sliders/AgricultureSlider")

onready var Bkgnd = get_node("PowerSources/TileMap")
var r = 255
var g
var b

var SPEED = 1

# Called when the node enters the scene tree for the first time.

func _ready():
	#Game should start paused
	yield(get_tree().create_timer(0.1), "timeout")
	get_tree().paused = true
	$CanvasLayer/HowToPlay.show()
	$CanvasLayer/Lose.hide()
	


func _on_WelcomeButton_pressed():
	get_tree().paused = false
	$CanvasLayer/HowToPlay.queue_free()
	$CanvasLayer/UIglobal._on_Pause_pressed()

func _on_TimeSlider_value_changed(value):
	SPEED = value
	print(value)
	if value == 0:
		$CanvasLayer/UIglobal._on_Pause_pressed()
		get_tree().paused = true
	else:
		$CanvasLayer/UIglobal._on_Play_pressed()
		get_tree().paused = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#Rikki
	delta = delta*SPEED
	
	#print(stepify(255-T0[1]*100 ,0.01))
	g =  stepify(255-(T0[1]-1.1)*100,0.01)
	b =  stepify(255-(T0[1]-1.1)*100,0.01)
	$Tween.interpolate_property(Bkgnd,"modulate",Bkgnd.modulate,Color8(r,g,b,255),0.2,Tween.TRANS_LINEAR)
	$Tween.start()
	#get_node("CanvasLayer/UILocal/HBoxContainer/YearTLabel").set_text("  Year: " + str(int(TYear)) + "  \n  F= " + str("%3.2f" % stepify(F[1],0.01)) + " W/m2 ")
	get_node("CanvasLayer/UIglobal/VBoxContainer/GlobEmit/Container/Label/YearTLabel").set_text("  F= " + str("%3.2f" % stepify(F[1]*512,0.01)) + " TW ")
	get_node("CanvasLayer/UIglobal/VBoxContainer/GlobEmit/Container/CO2TLabel").set_text("  CO2: " + str(int(co2)) + " ppm         " + str("%3.2f" % stepify(fc,0.01)) + " W/m2 ")
	get_node("CanvasLayer/UIglobal/VBoxContainer/GlobEmit/Container/CH4TLabel").set_text("  CH4: " + str(int(1000*ch4)) + " ppb         " + str("%3.2f" % stepify(fm,0.01)) + " W/m2 ")
	get_node("CanvasLayer/UIglobal/VBoxContainer/GlobEmit/Container/N2OTLabel").set_text("  N2O: " + str(int(1000*n2o)) + " ppb          " + str("%3.2f" % stepify(fn,0.01)) + " W/m2 ")
	get_node("CanvasLayer/UIglobal/VBoxContainer/GlobEmit/Container/AerTLabel").set_text("  Short-lived pollutants:     " + str("%3.2f" % stepify(fa[1],0.01)) + " W/m2 (cooling)")
	
	#Rishika
	TYear = TYear + delta
	GlobalVariables.GlobalTemp = T0[1]      # [0 1 2] middle sensitivity
	GlobalVariables.GlobalYear = TYear
	
	#Rikki
	if GlobalVariables.GlobalTemp >= 2.0:     # Lose_01
		print("Lose game")
		get_tree().paused = true
		$CanvasLayer/Lose.show()
	
	#Rishika
	CO2emissions = CO2emissions0 / 70.0 * (CO2fromElectricity * slider1.value + \
		CO2fromIndustry * slider2.value + CO2fromTransportation * slider3.value \
		+ CO2fromAgriculture * slider4.value + CO2fromBuildings * slider5.value)
	CH4emissions = CH4emissions0 / 70.0 * (CH4fromElectricity * slider1.value + \
		(CH4fromAgriculture+CH4fromWaste) * slider4.value + CH4fromBuildings * slider5.value)
	N2Oemissions = N2Oemissions0 / 70.0 * (N2OfromAgriculture * slider4.value + \
		N2OfromIndustry * slider2.value)
	
	co20 = co20 + delta*co2frac0*CO2emissions/4.401/1.8
	co21 = co21 + delta*co2frac1*CO2emissions/4.401/1.8 - co21/co2time1*delta
	co22 = co22 + delta*co2frac2*CO2emissions/4.401/1.8 - co22/co2time2*delta
	co23 = co23 + delta*co2frac3*CO2emissions/4.401/1.8 - co23/co2time3*delta
	co2 = co20 + co21 + co22 + co23
	ch4 = ch4 + delta*CH4emissions/1.604/1.8 - (ch4-ch4pre)/ch4time*delta
	n2o = n2o + delta*N2Oemissions/4.401/1.8 - (n2o-n2opre)/n2otime*delta
	fc = (a1*(co2-co2pre)*(co2-co2pre) + b1*(co2-co2pre) + c1*0.5*1000.0*(n2o+n2opre) + 5.36)*log(co2/co2pre)
	fn = (a2*0.5*(co2+co2pre) + b2*0.5*1000.0*(n2o+n2opre) + c2*0.5*1000.0*(ch4+ch4pre) + 0.117)*(sqrt(1000.0*n2o) - sqrt(1000.0*n2opre))
	fm = 1.55*(a3*0.5*1000.0*(ch4+ch4pre) + b3*0.5*1000.0*(n2o+n2opre) + 0.043)*(sqrt(1000.0*ch4) - sqrt(1000.0*ch4pre))
	
	for i in [0,1,2]:
		fa[i] = fa0[i] / 70.0 * (SulfatesfromElectricity * slider1.value + \
			SulfatesfromIndustry * slider2.value + SulfatesfromTransportation * \
			slider3.value + SulfatesfromAgriculture * slider4.value + \
			SulfatesfromBuildings * slider5.value)   # checking aerosol slider for each sensitivity
		F[i] = fc + fn + fm + fh + fa[i] 
		T0[i] = T0[i] + delta/C_s*(-lambda_eq[i]*T0[i]+eps*gamma*(Td0[i] - T0[i]) + F[i])
		Td0[i] = Td0[i] +delta/C_d*gamma*(T0[i] - Td0[i])
	if(timer%60==0): #Only graphs every 1 second or year
		#Temp v Year Graph
		#Middle Line Graph
		var x = (TYear-2020.5)*6.0+50 #diff in years * graphscale(6:1yr) + graph intercept
		var y = 350-(T0[1]*75.0) #graph intercept - temperature * graphscale(75:1degreeC)
		get_node("CanvasLayer/UIglobal/blank/PopupGraph/MidTempGraph").add_point(Vector2(x,y))
		#Low Line Graph
		y = 350-(T0[0]*75.0) #redo y calculation w low temp; y doesn't change
		get_node("CanvasLayer/UIglobal/blank/PopupGraph/LowTempGraph").add_point(Vector2(x,y))
		#High Line Graph
		y = 350-(T0[2]*75.0) #redo y calculation w high temp; y doesn't change
		get_node("CanvasLayer/UIglobal/blank/PopupGraph/HighTempGraph").add_point(Vector2(x,y))
		#F v Year Graph
		#Carbon
		y = 250 - (fc*50.0)
		get_node("CanvasLayer/UIglobal/blank/PopupGraph2/CO2Line").add_point(Vector2(x,y))
		#Methane
		y = 250 - (fm*50.0)
		get_node("CanvasLayer/UIglobal/blank/PopupGraph2/CH4Line").add_point(Vector2(x,y))
		#Aerosol
		y = 250 - (fa[1]*50.0)
		get_node("CanvasLayer/UIglobal/blank/PopupGraph2/AerosolLine").add_point(Vector2(x,y))
		#Total F
		y = 250 - (F[1]*50.0)
		get_node("CanvasLayer/UIglobal/blank/PopupGraph2/TotalFLineBackground").add_point(Vector2(x,y))
		get_node("CanvasLayer/UIglobal/blank/PopupGraph2/TotalFLine").add_point(Vector2(x,y))
	timer = timer + 1 





func _on_AreaIndia_mouse_entered():
	$lights/India.visible = true
func _on_AreaIndia_mouse_exited():
	$lights/India.visible = false


func _on_AreaNorthAmerica_mouse_entered():
	$lights/NAmerica.visible = true
func _on_AreaNorthAmerica_mouse_exited():
	$lights/NAmerica.visible = false


func _on_AreaSouthAmerica_mouse_entered():
	$lights/SAmerica.visible = true
func _on_AreaSouthAmerica_mouse_exited():
	$lights/SAmerica.visible = false


func _on_EUArea_mouse_entered():
	$lights/EUropia.visible = true
func _on_EUArea_mouse_exited():
	$lights/EUropia.visible = false


func _on_AfricaArea_mouse_entered():
	$lights/Africa.visible = true
func _on_AfricaArea_mouse_exited():
	$lights/Africa.visible = false


func _on_AustraliaArea_mouse_entered():
	$lights/Australia.visible = true
func _on_AustraliaArea_mouse_exited():
	$lights/Australia.visible = false





func _on_Lose_TryAgain_pressed():
	get_tree().reload_current_scene()


func _on_Lose_Back_pressed():
	var _d
	var destination = str("res://scenes/MainScene.tscn")
	_d = get_tree().change_scene(destination)



