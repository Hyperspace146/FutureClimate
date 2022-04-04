extends Sprite


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
#halocarbon emissions based erf
var fh = 0.0
var fh0 = 0.0
# aerosol (-1.1) + tropospheric ozone not caused by methane (-0.9)
var fa0 = [-0.5,-1.0,-1.7]
var fa = [-0.5,-1.0,-1.7]
var fc = 2.15
# 0.54 + 0.07 strat H2O + 0.15 trop oz = 0.76, 
var fm = 0.76
var fn = 0.19
var F = [2.53, 2.53, 2.53]

var timer = 0 #Used to space out graph updates

onready var Bkgnd = get_parent().get_node("TileMap")
var g
var b

# Called when the node enters the scene tree for the first time.

func _ready():
	get_parent().get_node("CanvasLayer/HowToPlay").show()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#Rikki
	#print(stepify(255-T0[1]*100 ,0.01))
	g =  stepify(255-(T0[1]-1.1)*100,0.01)
	b =  stepify(255-(T0[1]-1.1)*100,0.01)
	$Tween.interpolate_property(Bkgnd,"modulate",Bkgnd.modulate,Color8(255,g,b,255),0.2,Tween.TRANS_LINEAR)
	$Tween.start()
	
	# Rishikah
	TYear = TYear + delta
	GlobalVariables.GlobalYear = TYear
	CO2emissions = CO2emissions0/70.0*get_node("../CanvasLayer/Sliders/CO2Slider").value
	CH4emissions = CH4emissions0/70.0*get_node("../CanvasLayer/Sliders/CH4Slider").value
	N2Oemissions = N2Oemissions0/70.0*get_node("../CanvasLayer/Sliders/N2OSlider").value
	get_node("../CanvasLayer/Sliders/CO2Slider").hint_tooltip = str("%3.1f" % CO2emissions) + " Gton/yr"
	get_node("../CanvasLayer/Sliders/CH4Slider").hint_tooltip = str("%3.3f" % CH4emissions) + " Gton/yr"
	get_node("../CanvasLayer/Sliders/N2OSlider").hint_tooltip = str("%3.3f" % N2Oemissions) + " Gton/yr"
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
	#fh = fh - delta * fh0/230.0
	#if (fh < 0.0): 
	#	fh = 0.0
	for i in [0,1,2]:
		fa[i] = fa0[i]/70.0*get_node("../CanvasLayer/Sliders/ShortLivedSlider").value
		F[i] = fc + fn + fm + fh + fa[i] 
		T0[i] = T0[i] + delta/C_s*(-lambda_eq[i]*T0[i]+eps*gamma*(Td0[i] - T0[i]) + F[i])
		Td0[i] = Td0[i] +delta/C_d*gamma*(T0[i] - Td0[i])
	get_node("../CanvasLayer/Sliders/HBoxContainer/YearTLabel").set_text("  Year: " + str(int(TYear)) + "  \n  F= " + str("%3.2f" % stepify(F[1],0.01)) + " W/m2 ")
	get_node("../CanvasLayer/Sliders/HBoxContainer/CO2TLabel").set_text("  CO2: " + str(int(co2)) + " ppm \n        " + str("%3.2f" % stepify(fc,0.01)) + " W/m2 ")
	get_node("../CanvasLayer/Sliders/HBoxContainer/CH4TLabel").set_text("  CH4: " + str(int(1000*ch4)) + " ppb \n        " + str("%3.2f" % stepify(fm,0.01)) + " W/m2 ")
	get_node("../CanvasLayer/Sliders/HBoxContainer/N2OTLabel").set_text("  N2O: " + str(int(1000*n2o)) + " ppb \n        " + str("%3.2f" % stepify(fn,0.01)) + " W/m2 ")
	get_node("../CanvasLayer/Sliders/HBoxContainer/AerTLabel").set_text("  Short-lived pollutants:  \n        " + str("%3.2f" % stepify(fa[1],0.01)) + " W/m2 (cooling)")
	#get_node("../TempRect/TTLabel").set_text("  T: " + str("%3.2f" % stepify(T0,0.01)) + " C \n  Td: " + str("%3.2f" % stepify(Td0,0.01)) + " C ")
	get_node("../CanvasLayer/TempRect/TTLabel").set_text("  T: " + str("%3.2f" % stepify(T0[1],0.01)) + " C       ")
	get_node("../CanvasLayer/ForcingBox/CO2Rect").rect_size.y = int(fc/0.04)
	get_node("../CanvasLayer/ForcingBox/CO2Rect").hint_tooltip = "Carbon dioxide radiative forcing" 
	get_node("../CanvasLayer/ForcingBox/CH4Rect").rect_position.y = int(fc/0.04)
	get_node("../CanvasLayer/ForcingBox/CH4Rect").hint_tooltip = "Methane radiative forcing"
	get_node("../CanvasLayer/ForcingBox/CH4Rect").rect_size.y = int(fm/0.04)
	get_node("../CanvasLayer/ForcingBox/N2ORect").hint_tooltip = "Nitrous oxide radiative forcing"
	get_node("../CanvasLayer/ForcingBox/N2ORect").rect_position.y = int(fc/0.04)+int(fm/0.04)
	get_node("../CanvasLayer/ForcingBox/N2ORect").rect_size.y = int(fn/0.04)
	get_node("../CanvasLayer/ForcingBox2/AerRect").rect_size.y = int(-fa[1]/0.04)
	get_node("../CanvasLayer/ForcingBox2/AerRect").hint_tooltip = "Short-lived pollutant radiative forcing (cooling)"
	#Middle Temp Bar
	get_node("../CanvasLayer/TempRect").rect_position.y = 550 - int(T0[1]*100.0)
	get_node("../CanvasLayer/TempRect").rect_size.y = int(T0[1]*100.0)
	#Adding low line
	var lowDiff = int((T0[1]-T0[0])*100.0)
	get_node("../CanvasLayer/TempRect/LowLine").set_point_position(0,Vector2(-20,lowDiff))
	get_node("../CanvasLayer/TempRect/LowLine").set_point_position(1,Vector2(20,lowDiff))
	#Adding high line
	var highDiff = int((T0[1]-T0[2])*100.0)
	get_node("../CanvasLayer/TempRect/HighLine").set_point_position(0,Vector2(-20,highDiff))
	get_node("../CanvasLayer/TempRect/HighLine").set_point_position(1,Vector2(20,highDiff))
	if(timer%60==0): #Only graphs every 1 second or year
		#Temp v Year Graph
		#Middle Line Graph
		var x = (TYear-2020.5)*6.0+50 #diff in years * graphscale(6:1yr) + graph intercept
		var y = 350-(T0[1]*75.0) #graph intercept - temperature * graphscale(75:1degreeC)
		get_node("../CanvasLayer/PopupGraph/MidTempGraph").add_point(Vector2(x,y))
		#Low Line Graph
		y = 350-(T0[0]*75.0) #redo y calculation w low temp; y doesn't change
		get_node("../CanvasLayer/PopupGraph/LowTempGraph").add_point(Vector2(x,y))
		#High Line Graph
		y = 350-(T0[2]*75.0) #redo y calculation w high temp; y doesn't change
		get_node("../CanvasLayer/PopupGraph/HighTempGraph").add_point(Vector2(x,y))
		#F v Year Graph
		#Carbon
		y = 250 - (fc*50.0)
		get_node("../CanvasLayer/PopupGraph2/CO2Line").add_point(Vector2(x,y))
		#Methane
		y = 250 - (fm*50.0)
		get_node("../CanvasLayer/PopupGraph2/CH4Line").add_point(Vector2(x,y))
		#Aerosol
		y = 250 - (fa[1]*50.0)
		get_node("../CanvasLayer/PopupGraph2/AerosolLine").add_point(Vector2(x,y))
		#Total F
		y = 250 - (F[1]*50.0)
		get_node("../CanvasLayer/PopupGraph2/TotalFLineBackground").add_point(Vector2(x,y))
		get_node("../CanvasLayer/PopupGraph2/TotalFLine").add_point(Vector2(x,y))
	timer = timer + 1 

