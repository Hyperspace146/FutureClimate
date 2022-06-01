extends Control

# Global power and CO2 output values
onready var CO2_total = 0
onready var power_total = 0

# CONSTRUCTION
onready var sqrFt = find_node("SquareFootage")
onready var pplpRes = find_node("PeoplePerResidence")
onready var bldngLifetime = find_node("BuildingLifetime")
onready var bldngMaterial = find_node("BuildingMaterial")
onready var insulation = find_node("Insulation")
onready var climateZone = find_node("ClimateZone")
#onready var htClMethod = find_node("HeatCoolMethod")
#onready var battery = find_node("ConstructionPopUp/ConstructionSliders/BatterySize")
#onready var solarPanelSize = find_node("ConstructionPopUp/ConstructionSliders/SolarPanelSize")

# GROCERY
#onready var CalorieFractVege = find_node("CalorieFractVege")
onready var localFoodRatio = find_node("FractLocal")
onready var CalorieFractBeef = find_node("CalorieFractBeef")
onready var CalorieFractPoultry = find_node("CalorieFractPoultry")
onready var CalorieFractDairy =  find_node("CalorieFractDairy")
onready var FractWaste = find_node("FractWaste")
onready var processedFoodRatio = find_node("FractProcessed")

# RESIDENCE from simon
onready var FractCooked = find_node("FractCooked")
onready var FridgeEnergyUsage = find_node("FridgeEnergyUsage")
onready var WaterUsage = find_node("WaterUsage")
onready var HotWater = find_node("HotWaterHeater")
#onready var HeatedWater = find_node("WaterPopUp/WaterSliders/HeatedWater")
#onready var EnergyForCooking = find_node("CookingPopUp/CookingSliders/EnergyForCooking")
onready var stove = find_node("StoveType")
onready var elecType = find_node("Electricity")
onready var showerLength = find_node("ShowerLength")
onready var ClothesWashTemp = find_node("ClothesWashTemp")
onready var ClothesBought = find_node("ClothesBought")
#TECH 
onready var phoneUse = find_node("PhoneUsage")
onready var phoneStandby = find_node("PhoneUsageStandby")
onready var phoneLife = find_node("PhoneLifetime")
onready var laptopUse = find_node("LaptopUsage")
onready var laptopLife = find_node("LaptopLifetime")

# SCHOOL
onready var percentKids = find_node("PercentKids")
onready var SchoolsqrFtPerStudent = find_node("SchoolsqrFtPerStudent")
onready var PercentInsulated = find_node("PercentWellInsulated")
onready var SchoolEnergyUsageForOther = find_node("SchoolEnergyUsageForOther")

# HOSPITAL
onready var HospsqrFtPerPerson = find_node("HospsqrFtPerPerson")
onready var HospExtra = find_node("HospExtra")

onready var CommercialArea = find_node("CommercialArea")
#onready var CommercialPercent = find_node("CommercialPopUp/CommercialSliders/CommercialPercent")
onready var ShippingBoat = find_node("ShippingBoat")
onready var ShippingTrain = find_node("ShippingTrain")
onready var ShippingRoad = find_node("ShippingRoad")

#mobility - Carmen
onready var distAIR = find_node("MobilityAir")
onready var distBUS = find_node("MobilityBus")
onready var distRAIL = find_node("MobilityRail")
onready var distCAR = find_node("MobilityCar")
onready var distNON = find_node("MobilityNonMotorized") 


#Calculated quantities
var heating = 0
var illumination = 0
var homeEmbodied = 0
var energyForFoodChoice = 0
# Calculated quantities simon
var energyForResidence = 0
var cooking = 0
var waterheating = 0
var hotwatercook = 0
var services = 0
var clotheshotwater = 0
var energyForSchool = 0
var energyForHospital = 0
onready var totalPower = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
onready var totalCO2 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
onready var totalElec = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
var coalco2 = 8.76/1000.0 #1 kg/kWh = 8.76 kg/W
var gasco2 = 0.433 * 8.76/1000.0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# CONSTRUCTION
	sqrFt.min_value = 30 # square meters
	sqrFt.step = 5
	sqrFt.max_value = 750 # square meters
	sqrFt.value = 600
	var sqrFt0 = 300
	pplpRes.min_value = 1 # people
	pplpRes.max_value = 6 # people
	pplpRes.value = 2
	var pplpRes0 = 2
	bldngLifetime.min_value = 20 # years
	bldngLifetime.max_value = 100 # years
	bldngLifetime.value = 20
	var bldngLifetime0 = 50
#	insulation.min_value = 10 # kW hr / m^2 / year
#	insulation.max_value = 200 # kW hr / m^2 / year
#	insulation.value = 100
#	var insulation0 = 100
	climateZone.selected = 2
	insulation.selected = 0
	#battery.min_value = 0 # kW hr
	#battery.max_value = 100 # kW hr
	#var battery0 = 0
	#solarPanelSize.min_value = 0 #  kW
	#solarPanelSize.max_value = 25 # kW
	#var solarPanelSize0 = 0
	
		# RESIDENCE from simon
	WaterUsage.min_value = 25 # liters / day
	WaterUsage.max_value = 500 # liters / day
	WaterUsage.value = 450
#	HeatedWater.min_value = 5 # liters / day
#	HeatedWater.max_value = 200 # liters / day
#	HeatedWater.value = 200
	showerLength.min_value = 0.0
	showerLength.max_value = 20.0
	showerLength.value = 16
	ClothesBought.value = 10.0
	ClothesBought.min_value = 0.0
	ClothesBought.max_value = 12.0
#	HotWaterTemp.min_value = 49.0
#	HotWaterTemp.max_value = 65.0
#	HotWaterTemp.value = 55.0
	HotWater.selected = 0
	ClothesWashTemp.selected = 0 
		
	# GROCERY
	localFoodRatio.min_value = 50.0
	localFoodRatio.max_value = 200.0
	localFoodRatio.value = 50
	CalorieFractBeef.min_value = 0 # %
	CalorieFractBeef.max_value = 20 # %
	CalorieFractBeef.value = 20
	CalorieFractPoultry.min_value = 0 # %
	CalorieFractPoultry.max_value = 20 # %
	CalorieFractPoultry.value = 20
	CalorieFractDairy.min_value = 0 # %
	CalorieFractDairy.max_value = 20.0 # %
	CalorieFractDairy.value = 20
	FractWaste.min_value = 7.0 # %
	FractWaste.max_value = 70.0 # %
	FractWaste.value = 60.0
	processedFoodRatio.min_value = 35.0
	processedFoodRatio.max_value = 200.0
	processedFoodRatio.value = 25
	
	# COOKING
	elecType.selected = 0
	stove.selected = 0
	FractCooked.min_value = 0 # %
	FractCooked.max_value = 100 # %
	FractCooked.value = 80
	FridgeEnergyUsage.min_value = 14 # Watts
	FridgeEnergyUsage.max_value = 100 # Watts
	FridgeEnergyUsage.value = 68
	
	# TECH
	phoneUse.min_value = 0
	phoneUse.max_value = 18
	phoneUse.value = 16
	phoneStandby.min_value = 0
	phoneStandby.max_value = 24
	phoneStandby.value = 20
	phoneLife.min_value = 1
	phoneLife.max_value = 10
	phoneLife.value = 2
	laptopLife.min_value = 1
	laptopLife.max_value = 12
	laptopLife.value = 4
	laptopUse.min_value = 0
	laptopUse.max_value = 24
	laptopUse.value = 8
	
	# SCHOOL
	SchoolsqrFtPerStudent.min_value = 2.0 # %
	SchoolsqrFtPerStudent.max_value = 20.0 # %
	SchoolsqrFtPerStudent.value = 10.0
	#SchoolEmbodied.min_value = 4.0
	#SchoolEmbodied.max_value = 12.0
	#SchoolEmbodied.value = 4.0
	SchoolEnergyUsageForOther.min_value = 0
	SchoolEnergyUsageForOther.max_value = 100
	SchoolEnergyUsageForOther.value = 80
	percentKids.min_value = 10.0
	percentKids.max_value = 30.0
	percentKids.value = 20.0
	PercentInsulated.value = 15.0
	PercentInsulated.min_value = 0.0
	PercentInsulated.max_value = 100.0
	
	#MEDICAL
	#1.6 m2/cap * 3 for other medical space
	HospsqrFtPerPerson.min_value = 0.0
	HospsqrFtPerPerson.max_value = 20.0
	HospsqrFtPerPerson.value = 5.0
	HospExtra.min_value = 0
	HospExtra.max_value = 45
	HospExtra.value = 30
	
	# COMMERCIAL
	CommercialArea.value = 25.0
	CommercialArea.min_value = 0.0
	CommercialArea.max_value = 30.0
	ShippingRoad.value = 2.3
	ShippingRoad.min_value = 0.0
	ShippingRoad.max_value = 100.0
	ShippingTrain.value = 0.0
	ShippingTrain.min_value = 0.0
	ShippingTrain.max_value = 100.0
	ShippingBoat.min_value = 0.0
	ShippingBoat.max_value = 100.0
	ShippingBoat.value = 0.0
	#ShippingIntensity.value = 
	#ShippingIntensity.min_value = 
	#ShippingIntensity.max_value = 
	
	#MOBILITY - Carmen
	distAIR.min_value = 0.0 #km
	distAIR.max_value = 25000 #km
	distAIR.value = 8000 #km
	distRAIL.min_value = 0.0 #km
	distRAIL.max_value = 25000 #km
	distRAIL.value = 191 #km
	distBUS.min_value = 0.0 #km
	distBUS.max_value = 25000 #km
	distBUS.value = 1855 #km
	distCAR.min_value = 0.0 #km
	distCAR.max_value = 25000 #km
	distCAR.value = 23980 #km
	distNON.min_value = 0 #km
	distNON.max_value = 25000 #km
	distNON.value = 137 #km
	# emfAIR = 1.17 #MJ
	# emfRAIL =  0.287 #MJ
	# emfBUS = 0.27 #MJ
	# emfCAR = 0.56 #MJ
	# emfNON = 0 #MJ
	
	set_waterheatingcooking()
	set_energyForFoodChoice()
	set_heating()
	set_homeEmbodied()
	set_appliances()
	set_services()
	set_embodied()
	set_mobility()
	
	totalpowercalc()
	
func totalpowercalc(): 
	#crank up 15% for energy infrastructure
	power_total = 1.15*(totalPower[0] + totalPower[1] + totalPower[2] + totalPower[3] + totalPower[4] + totalPower[5] + totalPower[6] + totalPower[7])
	
	get_node("VBoxContainer/OutputUI/UICity/Total").text = str("%3.0f" % power_total) + " W"
	var totalel = (totalElec[0] + totalElec[1] + totalElec[2] + totalElec[3] + totalElec[4] + totalElec[5])
	var elecCO2 = 0.0
	CO2_total = (totalCO2[0] + totalCO2[1] + totalCO2[2] + totalCO2[3] + totalCO2[4] + totalCO2[5]) 
	get_node("VBoxContainer/OutputUI/CO2UICity/Total").text = str("%3.1f" % CO2_total) + " tons"

func set_energyForFoodChoice():
	var PTDFract = 150.0 + 20.0*100.0/find_node("FractLocal").value + 130.0/100.0*find_node("FractProcessed").value
	energyForFoodChoice = (1.0 + FractWaste.value/100.0) * (100.0 * 0.2 * (1.0 + 23.0*CalorieFractBeef.value/100.0 + 10.0*CalorieFractPoultry.value/100.0 + 5.0*CalorieFractDairy.value/100.0) + 100.0 * 0.23 * (PTDFract)/100.0)
	get_node("VBoxContainer/OutputUI/UICity/FoodLabel").text = "Food:   " + str("%3.0f" % energyForFoodChoice) + " W"
	totalPower[0] = energyForFoodChoice
	totalpowercalc()

#func set_energyForResidence():
#	energyForResidence = (sqrFt.value/pplpRes.value)*6 + (WaterUsage.value * 0.365 * EnergyForWater.value) + (HeatedWater.value * 4.42) + (100 * FractCooked.value * EnergyForCooking.value) + (FridgeEnergyUsage.value / pplpRes.value) + 2 + 0.4 
		# efficient heat pump not used
		# making a fridge + induction cooker
#	find_node("UICity/AppliancesLabel").text = "Res: " + str("%3.1f" % energyForResidence) + " Watts"

func set_heating():
	var CO2heating = 0
	var elecheating = 0
	if (climateZone.selected == 0): #tropical
		heating = sqrFt.value * 60.0/pplpRes.value/8.76 #kilo-hours per year
	if (climateZone.selected == 1): #subtropical 
		heating = sqrFt.value * 100.0/pplpRes.value/8.76 #kilo-hours per year	
	if (climateZone.selected == 2): #temperate
		heating = sqrFt.value * 150.0/pplpRes.value/8.76 #kilo-hours per year
	if (climateZone.selected == 3): #cold
		heating = sqrFt.value * 200.0/pplpRes.value/8.76 #kilo-hours per year
	if (insulation.selected == 1): #medium
		heating = heating/2.0
	if (insulation.selected == 2): #good
		heating = heating/4.0
	if (insulation.selected == 3): #passivehouas
		heating = heating/6.0
	#if (htClMethod.selected == 0): 
	#	CO2heating = 1.778 * heating/1000.0
	#if (htClMethod.selected == 1): 
	#	elecheating = heating
	#if (htClMethod.selected == 2): 
	#	heating = heating/5.0
	#	elecheating = heating
	get_node("VBoxContainer/OutputUI/UICity/HeatLabel").text = "Heat: " + str("%3.0f" % heating) + " W"
	totalPower[1] = heating
	totalElec[1] = elecheating
	if (elecType.selected == 0): #coal
		CO2heating = CO2heating + coalco2 * elecheating
	if (elecType.selected == 1): #gas
		CO2heating = CO2heating + gasco2 * elecheating
	if (elecType.selected == 2): #renewable
		CO2heating = CO2heating
	totalCO2[1] = CO2heating
	get_node("VBoxContainer/OutputUI/CO2UICity/HeatLabel").text = "Heat: " + str("%3.1f" % CO2heating) + " t"
	totalpowercalc()

func set_homeEmbodied():
	#CO2 footprint from 
	#https://www.napier.ac.uk/~/media/worktribe/output-2753394/whole-life-embodied-carbon-in-multi-storey-buildings-steel-concrete-and-timber.pdf
	var CO2homeEmbodied = 0.0
	if (bldngMaterial.selected == 0): #timber
		homeEmbodied = sqrFt.value * 30.0*80.0/bldngLifetime.value/pplpRes.value/31.536
		CO2homeEmbodied = sqrFt.value * 0.119/bldngLifetime.value/pplpRes.value
	if (bldngMaterial.selected == 1): #concrete
		homeEmbodied = sqrFt.value * 50.0*80.0/bldngLifetime.value/pplpRes.value/31.536
		CO2homeEmbodied = sqrFt.value * 0.185/bldngLifetime.value/pplpRes.value
	if (bldngMaterial.selected == 2): #steel
		homeEmbodied = sqrFt.value * 100.0*80.0/bldngLifetime.value/pplpRes.value/31.536
		CO2homeEmbodied = sqrFt.value * 0.228/bldngLifetime.value/pplpRes.value
	get_node("VBoxContainer/OutputUI/UICity/HomeLabel").text = "Home: " + str("%3.0f" % homeEmbodied) + " W"
	totalPower[2] = homeEmbodied
	totalCO2[2] = CO2homeEmbodied
	get_node("VBoxContainer/OutputUI/CO2UICity/HomeLabel").text = "Home: " + str("%3.1f" % CO2homeEmbodied) + " t"
	totalpowercalc()
	
func set_illumination():
	var lighttime = 6.0/24.0 #lights on per day
	var lightpercent = 0.33 #percent of residence that's lit
	var brightness = 1.0 #watts per meter squared
	var lightefficiency = 0.2 # for incandescent
	illumination = sqrFt.value/pplpRes.value * lighttime * lightpercent * brightness / lightefficiency
	
func set_waterheatingcooking():
	var calories = (1.0 + FractWaste.value/100.0 )* (100.0) #Calories per day in watts
	var CO2cooking = 0.0
	var electriccooking = 0.0
#	if (stove.selected == 0): #wood
#		cooking = calories * FractCooked.value/100.0 * 1.5 #approx 10 MJ/kg
	if (stove.selected == 0): #gas
		cooking = calories * FractCooked.value/100.0 * 0.956 #world average
		CO2cooking = cooking * 1.778/1000.0
	if (stove.selected == 1): #electric
		cooking = calories * FractCooked.value/100.0 * 0.7 #higher efficiency
		electriccooking = cooking
	if (stove.selected == 2): #induction/pressure cooker
		cooking = calories * FractCooked.value /100.0* 0.4 #induction
		electriccooking = cooking
	if (ClothesWashTemp.selected == 0): 
		clotheshotwater = 40.0/2.0
	if (ClothesWashTemp.selected == 1): 
		clotheshotwater = 20.0/2.0
	if (ClothesWashTemp.selected == 2): 
		clotheshotwater = 0.0
	if (climateZone.selected == 0): 
		waterheating = (showerLength.value*6.0 + clotheshotwater + 10.0)* (50.0 - 25.0)/20.0
	if (climateZone.selected == 1): 
		waterheating = (showerLength.value*6.0 + clotheshotwater + 10.0)* (50.0 - 20.0)/20.0
	if (climateZone.selected == 2): 
		waterheating = (showerLength.value*6.0 + clotheshotwater + 10.0)* (50.0 - 10.0)/20.0
	if (climateZone.selected == 3): 
		waterheating = (showerLength.value*6.0 + clotheshotwater + 10.0)* (50.0 - 0.0)/20.0
	if (HotWater.selected == 0): #gas hot water
		CO2cooking = CO2cooking + 1.778 * waterheating/1000.0
	if (HotWater.selected == 1): #electric hot water
		electriccooking = electriccooking + waterheating
	hotwatercook = waterheating + cooking
	get_node("VBoxContainer/OutputUI/UICity/HotWaterCookLabel").text = "Hot H2O: " + str("%3.0f" % hotwatercook) + " W"
	get_node("VBoxContainer/OutputUI/CO2UICity/HotWaterCookLabel").text = "Hot H2O: " + str("%3.1f" % CO2cooking) + " t"
	totalPower[3] = hotwatercook
	totalCO2[3] = CO2cooking
	totalElec[3] = electriccooking
	totalpowercalc()
	
func set_embodied(): 
	var CO2embodied = 0.0
	#shared: 8 W for a fridge with 14 year lifetime, 1.6 W for cooking with 20 year lifetime)
	#indiv: 7 W-yr for phone
	# assuming 30 W for new clothes based on current numbers (not best)
	var clothesemb = ClothesBought.value /2.0 * 30.0 
	var embodied = (8.0+ 1.6)/pplpRes.value + 7.0/phoneLife.value + 120.0/laptopLife.value +clothesemb
	get_node("VBoxContainer/OutputUI/UICity/EmbodiedLabel").text = "Embodied: " + str("%3.0f" % embodied) + " W"
	totalPower[4] = embodied
	totalElec[4] = embodied
	if (elecType.selected == 0): 
		CO2embodied = embodied * coalco2
	if (elecType.selected == 1): 
		CO2embodied = embodied * gasco2
	totalCO2[4] = CO2embodied
	totalpowercalc()
	get_node("VBoxContainer/OutputUI/CO2UICity/EmbodiedLabel").text = "Embodied: " + str("%3.1f" % CO2embodied) + " t"
	
func set_services(): 
	#6 W for waste management, 5 W for cell phone networks, 25 W for laptop network -- all assumed electric
	#water: 20 L for clothes washing, plus shower. (this category measures delivery, we assume electric)
	#8 L/min shower * 10 min avg = 80 L
	var CO2services = 0.0
	var schmedEmb
	var waterfactor = 1
	if(climateZone.selected == 0): 
		schmedEmb = 1.4 * 60.0/8.76
	if(climateZone.selected == 1): 
		schmedEmb = 1.4 * 100.0/8.76
		waterfactor = 2.0
	if(climateZone.selected == 2): 
		schmedEmb = 1.4 * 150.0/8.76
	if(climateZone.selected == 3): 
		schmedEmb = 1.4 * 200.0/8.76
	#at this point schmedEmb is watts of heating/cooling. 
	schmedEmb = schmedEmb * (1 - 0.9 * PercentInsulated.value/100.0)
	
	#assumed a 70 year lifetime for schools and 3 times the construction cost
	#hospital 3x square footage but otherwise the same as school? plus extra usage
	#comm
	var school = (schmedEmb* SchoolsqrFtPerStudent.value + SchoolEnergyUsageForOther.value + 3.0 * SchoolsqrFtPerStudent.value * 40.0*80.0/70.0/31.536)*percentKids.value/100.0
	var med = (schmedEmb* HospsqrFtPerPerson.value +HospExtra.value + 9.0 * HospsqrFtPerPerson.value * 40.0*80.0/70.0/31.536)
	var comm = (schmedEmb* CommercialArea.value + 3.0 * CommercialArea.value * 40.0*80.0/70.0/31.536)*percentKids.value/100.0
	services = 6.0 + (WaterUsage.value + showerLength.value * 8.0 + 20.0)*0.056*waterfactor + 5.0 + 25.0 + school + med + comm
	get_node("VBoxContainer/OutputUI/UICity/ServicesLabel").text = "Services:   " + str("%3.0f" % services) + " W"
	totalPower[5] = services
	if (elecType.selected == 0): 
		CO2services = coalco2*services
	if (elecType.selected == 1): 
		CO2services = gasco2*services
	totalpowercalc()
	
func set_mobility(): 
	var co2mobility = 0.0
	#energy multiplicative factors (emf) defined as constants below until reductions section done
	var emfAIR = 1.17 #MJ
	var emfRAIL =  0.287 #MJ
	var emfBUS = 0.27 #MJ
	var emfCAR = 0.56 #MJ
	var emfNON = 0 #MJ
	var EngrAIR = distAIR.value*emfAIR*0.03173516
	var EngrRAIL = distRAIL.value*emfRAIL*0.03173516
	var EngrBUS = distBUS.value*emfBUS*0.03173516
	var EngrCAR = distCAR.value*emfCAR*0.03173516
	var EngrNON = distNON.value*emfNON*0.03173516
	var mobility = EngrAIR + EngrRAIL + EngrBUS + EngrCAR + EngrNON
	get_node("VBoxContainer/OutputUI/UICity/MobilityLabel").text = "Mobility: " + str("%3.0f" % mobility) + " W"
	totalPower[6] = mobility
	totalpowercalc()
	get_node("VBoxContainer/OutputUI/CO2UICity/MobilityLabel").text = "Mobility: " + str("%3.1f" % co2mobility) + " t"
	
func set_appliances(): 
	var CO2appliances = 0.0
	var appliances = FridgeEnergyUsage.value/pplpRes.value + phoneUse.value*5.0/24.0 + phoneStandby.value*1.0/24.0 + laptopUse.value*100.0/24.0
	get_node("VBoxContainer/OutputUI/UICity/AppliancesLabel").text = "Appliance: " + str("%3.0f" % appliances) + " W"
	totalPower[7] = appliances
	totalElec[7] = appliances
	if (elecType.selected == 0): 
		CO2appliances = appliances * coalco2
	if (elecType.selected == 1): 
		CO2appliances = appliances * gasco2
	get_node("VBoxContainer/OutputUI/CO2UICity/AppliancesLabel").text = "Appliance: " + str("%3.1f" % CO2appliances) + " t"
	totalCO2[7] = CO2appliances
	totalpowercalc()


# GROCERY LISTENERS
func _on_CalorieFractBeef_value_changed(value):
	set_energyForFoodChoice()
	find_node("CalorieFractBeefValueLabel").text = str("%3.1f" % CalorieFractBeef.value) + "%"

func _on_CalorieFractPoultry_value_changed(value):
	set_energyForFoodChoice()
	find_node("CalorieFractPoultryValueLabel").text = str("%3.1f" % CalorieFractPoultry.value) + "%"
	
func _on_CalorieFractDairy_value_changed(value):
	set_energyForFoodChoice()
	find_node("CalorieFractDairyValueLabel").text = str("%3.1f" % CalorieFractDairy.value) + "%"

func _on_FractWaste_value_changed(value):
	set_energyForFoodChoice()
	find_node("FractWasteValueLabel").text = str("%3.1f" % FractWaste.value) + "%"

func _on_FractLocal_value_changed(value):
	set_energyForFoodChoice()
	find_node("FractLocalValueLabel").text = str("%1.2f" % (localFoodRatio.value/100.0)) + " X"

func _on_FractProcessed_value_changed(value):
	set_energyForFoodChoice()
	find_node("FractProcessedValueLabel").text = str("%1.2f" % (processedFoodRatio.value/100.0)) + " X"
	

# CONSTRUCTION LISTENERS
func _on_SquareFootage_value_changed(value):
	#affects heating, home_embodied, illumination
	set_heating()
	set_illumination()
	set_homeEmbodied()
	find_node("SquareFootageValueLabel").text = str(sqrFt.value) + " sq meters per residence"

func _on_PeoplePerResidence_value_changed(value):
	#affects appliances: refrigerator, stove, embodied energy of home, 
	set_heating() 
	set_illumination()
	set_homeEmbodied()
	set_appliances()
#	find_node("PeoplePerResidenceLabel").text = str(pplpRes.value) + " people per residence"
#	if value == 1: 
#		find_node("PeoplePerResidenceLabel").text = str(pplpRes.value) + " person per residence"

func _on_BuildingLifetime_value_changed(value):
	#affect embodied energy of home
	set_homeEmbodied()
	#find_node("BuildingLifetimeLabel").text = str(bldngLifetime.value) + " yr lifetime of building"

func _on_Insulation_item_selected(id):
	set_heating()
	
func _on_BuildingMaterial_item_selected(id):
	set_homeEmbodied()

func _on_ClimateZone_item_selected(id):
	set_heating()
	set_waterheatingcooking()


# WATER LISTENERS
func _on_WaterUsage_value_changed(value):
	set_services()
	find_node("WaterUsageValueLabel").text = str(value) + " L"

func _on_HeatedWater_value_changed(value):
	set_waterheatingcooking()
	find_node("HeatedWaterValueLabel").text = str(value) + " L"

func _on_ShowerLength_value_changed(value):
	set_waterheatingcooking()
	set_services()
	find_node("ShowerLengthValueLabel").text = str(value) + " min"
	
func _on_HotWaterHeater_item_selected(index):
	set_waterheatingcooking()

#func _on_Hotwatertemp_value_changed(value):
#	set_waterheatingcooking()
#	var tempf = round(value*9.0/5.0 + 32.0)
#	find_node("WaterPopUp/WaterSliders/Hotwatertemp/Label").text = "Hot water temp = " + str(value) + " C (" + str(tempf) + ") F"

func _on_ClothesWashTemp_item_selected(id):
	set_waterheatingcooking()

func _on_ClothesBought_value_changed(value):
	set_embodied()
	find_node("ClothesBoughtValueLabel").text = str(value) + " outfits per year"


# COOKING LISTENERS
func _on_StoveType_item_selected(id):
	set_waterheatingcooking()
	
func _on_FractCooked_value_changed(value):
	set_waterheatingcooking()
	find_node("FractCookedValueLabel").text = str(value) + " %"
	
func _on_FridgeEnergyUsage_value_changed(value):
	set_appliances()
	find_node("FridgeEnergyUsageValueLabel").text = str(value) + " W"
	
func _on_EnergyForCooking_value_changed(value):
	pass # Replace with function body.
	
func _on_Electricity_item_selected(id):
	set_heating()
	set_appliances()
	set_embodied()
	set_mobility()
	set_waterheatingcooking()
	set_energyForFoodChoice()
	set_homeEmbodied()
	set_services()


# TECH LISTENERS
func _on_ToTech_pressed():
	find_node("CookingPopUp").visible = false
	find_node("TechPopUp").visible = true
	find_node("TechPopUp").rect_position = Vector2(29,160)

func _on_PhoneUsage_value_changed(value):
	set_appliances()
	find_node("PhoneUsageValueLabel").text = str(value) + " hrs/day"
	if (value == 1): 
		find_node("PhoneUsageValueLabel").text = str(value) + " hr/day"

func _on_PhoneUsageStandby_value_changed(value):
	set_appliances()
	find_node("PhoneUsageStandbyValueLabel").text = str(value) + " hrs/day"
	if (value == 1 ): 
			find_node("PhoneUsageStandbyValueLabel").text = str(value) + " hr/day"

func _on_PhoneLifetime_value_changed(value):
	set_embodied()
	find_node("PhoneLifetimeValueLabel").text = str(value) + " years"
	if (value == 1): 
		find_node("PhoneLifetimeValueLabel").text = str(value) + " year"

func _on_LaptopUsage_value_changed(value):
	set_appliances()
	find_node("LaptopUsageValueLabel").text = str(value) + " hrs/day"
	if (value == 1): 
		find_node("LaptopUsageValueLabel").text = str(value) + " hr/day"

func _on_LaptopLifetime_value_changed(value):
	set_embodied()
	find_node("LaptopLifetimeValueLabel").text = str(value) + " years"
	if (value == 1): 
		find_node("LaptopLifetimeValueLabel").text = str(value) + " year"


# SCHOOL LISTENERS
func _on_SchoolsqrFtPerStudent_value_changed(value):
	set_services()
	find_node("SchoolsqrFtPerStudentValueLabel").text = str(value) + " square meters per student"

func _on_PercentKids_value_changed(value):
	set_services()
	find_node("PercentKidsValueLabel").text = str(value) + "%"

func _on_SchoolEnergyUsageForOther_value_changed(value):
	set_services()
	find_node("SchoolEnergyUsageForOtherValueLabel").text = str(value) + " W"

func _on_HospsqrFtPerPerson_value_changed(value):
	set_services()
	find_node("HospsqrFtPerPersonValueLabel").text = str(value) + " square meters per person"

func _on_HospExtra_value_changed(value):
	set_services()
	find_node("HospExtraValueLabel").text = str(value) + " W"

func _on_PercentWellInsulated_value_changed(value):
	set_services()
	find_node("PercentWellInsulatedValueLabel").text = str(value) + "%"


# COMMERCIAL LISTENERS
func _on_CommercialArea_value_changed(value):
	set_services()
	find_node("CommercialAreaValueLabel").text = str(value) + " square meters"


# MOBILITY LABELS - Carmen
func _on_MobilityAir_value_changed(value):
	var totalmobility = distAIR.value + distRAIL.value + distBUS.value + distCAR.value + distNON.value
	var percentAirTravel = distAIR.value / totalmobility * 100.0
	var percentBusTravel = distBUS.value / totalmobility * 100.0
	var percentRailTravel = distRAIL.value /totalmobility * 100.0
	var percentCarTravel = distCAR.value / totalmobility * 100.0
	var percentNonMotorizedTravel = distNON.value / totalmobility * 100.0
	find_node("MobilityAirValueLabel").text = str("%1.2f" % percentAirTravel) + "% total distance traveled"
	find_node("MobilityBusValueLabel").text = str("%1.2f" % percentBusTravel) + "% total distance traveled"
	find_node("MobilityRailValueLabel").text = str("%1.2f" % percentRailTravel) + "% total distance traveled"
	find_node("MobilityCarValueLabel").text = str("%1.2f" % percentCarTravel) + "% total distance traveled"
	find_node("MobilityNonMotorizedValueLabel").text = str("%1.2f" % percentNonMotorizedTravel) + "% total distance traveled"
	find_node("MobilityAirValueLabel").text = str(value) + " km/year"
	set_mobility()


func _on_MobilityBus_value_changed(value):
	var totalmobility = distAIR.value + distRAIL.value + distBUS.value + distCAR.value + distNON.value
	var percentAirTravel = distAIR.value / totalmobility * 100.0
	var percentBusTravel = distBUS.value / totalmobility * 100.0
	var percentRailTravel = distRAIL.value /totalmobility * 100.0
	var percentCarTravel = distCAR.value / totalmobility * 100.0
	var percentNonMotorizedTravel = distNON.value / totalmobility * 100.0
	find_node("MobilityAirValueLabel").text = str("%1.2f" % percentAirTravel) + "% total distance traveled"
	find_node("MobilityBusValueLabel").text = str("%1.2f" % percentBusTravel) + "% total distance traveled"
	find_node("MobilityRailValueLabel").text = str("%1.2f" % percentRailTravel) + "% total distance traveled"
	find_node("MobilityCarValueLabel").text = str("%1.2f" % percentCarTravel) + "% total distance traveled"
	find_node("MobilityNonMotorizedValueLabel").text = str("%1.2f" % percentNonMotorizedTravel) + "% total distance traveled"
	find_node("MobilityAirValueLabel").text = str(value) + " km/year"
	set_mobility()


func _on_MobilityRail_value_changed(value):
	var totalmobility = distAIR.value + distRAIL.value + distBUS.value + distCAR.value + distNON.value
	var percentAirTravel = distAIR.value / totalmobility * 100.0
	var percentBusTravel = distBUS.value / totalmobility * 100.0
	var percentRailTravel = distRAIL.value /totalmobility * 100.0
	var percentCarTravel = distCAR.value / totalmobility * 100.0
	var percentNonMotorizedTravel = distNON.value / totalmobility * 100.0
	find_node("MobilityAirValueLabel").text = str("%1.2f" % percentAirTravel) + "% total distance traveled"
	find_node("MobilityBusValueLabel").text = str("%1.2f" % percentBusTravel) + "% total distance traveled"
	find_node("MobilityRailValueLabel").text = str("%1.2f" % percentRailTravel) + "% total distance traveled"
	find_node("MobilityCarValueLabel").text = str("%1.2f" % percentCarTravel) + "% total distance traveled"
	find_node("MobilityNonMotorizedValueLabel").text = str("%1.2f" % percentNonMotorizedTravel) + "% total distance traveled"
	find_node("MobilityAirValueLabel").text = str(value) + " km/year"
	set_mobility()



func _on_MobilityCar_value_changed(value):
	var totalmobility = distAIR.value + distRAIL.value + distBUS.value + distCAR.value + distNON.value
	var percentAirTravel = distAIR.value / totalmobility * 100.0
	var percentBusTravel = distBUS.value / totalmobility * 100.0
	var percentRailTravel = distRAIL.value /totalmobility * 100.0
	var percentCarTravel = distCAR.value / totalmobility * 100.0
	var percentNonMotorizedTravel = distNON.value / totalmobility * 100.0
	find_node("MobilityAirValueLabel").text = str("%1.2f" % percentAirTravel) + "% total distance traveled"
	find_node("MobilityBusValueLabel").text = str("%1.2f" % percentBusTravel) + "% total distance traveled"
	find_node("MobilityRailValueLabel").text = str("%1.2f" % percentRailTravel) + "% total distance traveled"
	find_node("MobilityCarValueLabel").text = str("%1.2f" % percentCarTravel) + "% total distance traveled"
	find_node("MobilityNonMotorizedValueLabel").text = str("%1.2f" % percentNonMotorizedTravel) + "% total distance traveled"
	find_node("MobilityAirValueLabel").text = str(value) + " km/year"
	set_mobility()

func _on_MobilityNonMotorized_value_changed(value):
	var totalmobility = distAIR.value + distRAIL.value + distBUS.value + distCAR.value + distNON.value
	var percentAirTravel = distAIR.value / totalmobility * 100.0
	var percentBusTravel = distBUS.value / totalmobility * 100.0
	var percentRailTravel = distRAIL.value /totalmobility * 100.0
	var percentCarTravel = distCAR.value / totalmobility * 100.0
	var percentNonMotorizedTravel = distNON.value / totalmobility * 100.0
	find_node("MobilityAirValueLabel").text = str("%1.2f" % percentAirTravel) + "% total distance traveled"
	find_node("MobilityBusValueLabel").text = str("%1.2f" % percentBusTravel) + "% total distance traveled"
	find_node("MobilityRailValueLabel").text = str("%1.2f" % percentRailTravel) + "% total distance traveled"
	find_node("MobilityCarValueLabel").text = str("%1.2f" % percentCarTravel) + "% total distance traveled"
	find_node("MobilityNonMotorizedValueLabel").text = str("%1.2f" % percentNonMotorizedTravel) + "% total distance traveled"
	find_node("MobilityAirValueLabel").text = str(value) + " km/year"
	set_mobility()

func _on_CO2Button_pressed():
	find_node("CO2UICity").visible = true
	find_node("UICity").visible = false


func _on_PowerButton_pressed():
	find_node("CO2UICity").visible = false
	find_node("UICity").visible = true


func _on_ToMobility2_pressed():
	find_node("MobilityPopUp").visible = true
	find_node("MobilityPopUp").rect_position = Vector2(29,160)
	find_node("ConstructionPopUp").visible = false
	


func _on_ToConstruction2_pressed():
	find_node("ConstructionPopUp").visible = true
	find_node("ConstructionPopUp").rect_position = Vector2(29,160)
	find_node("GroceryPopUp").visible = false
	


func _on_ToGrocery2_pressed():
	find_node("GroceryPopUp").visible = true
	find_node("GroceryPopUp").rect_position = Vector2(29,160)
	find_node("WaterPopUp").visible = false
	
func _on_ToWater2_pressed():
	find_node("WaterPopUp").visible = true
	find_node("WaterPopUp").rect_position = Vector2(29,160)
	find_node("CookingPopUp").visible = false

func _on_ToCooking2_pressed():
	find_node("CookingPopUp").visible = true
	find_node("CookingPopUp").rect_position = Vector2(29,160)
	find_node("TechPopUp").visible = false

func _on_ToTech2_pressed():
	find_node("TechPopUp").visible = true
	find_node("TechPopUp").rect_position = Vector2(29,160)
	find_node("SchoolPopUp").visible = false

func _on_ToSchool2_pressed():
	find_node("SchoolPopUp").visible = true
	find_node("SchoolPopUp").rect_position = Vector2(29,160)
	find_node("CommercialPopUp").visible = false
	
func _on_ToCommercial2_pressed():
	find_node("CommercialPopUp").visible = true
	find_node("CommercialPopUp").rect_position = Vector2(29,160)
	find_node("MobilityPopUp").visible = false


func _on_ToCooking_toggled(button_pressed):
	pass # Replace with function body.


func _on_ToGrocery2_toggled(button_pressed):
	pass # Replace with function body.


func _on_ToSchool_toggled(button_pressed):
	pass # Replace with function body.


func _on_SchoolHeating_item_selected(index):
	pass # Replace with function body.


func _on_SchoolHeating2_item_selected(index):
	pass # Replace with function body.


func _on_CommercialHeating_item_selected(index):
	pass # Replace with function body.


func _on_ShippingBoat_value_changed(value):
	pass # Replace with function body.


func _on_ShippingTrain_value_changed(value):
	pass # Replace with function body.


func _on_ShippingRoad_value_changed(value):
	pass # Replace with function body.


func _on_Car_sharing_value_changed(value):
	pass # Replace with function body.


func _on_Car_fuel_efficiency_value_changed(value):
	pass # Replace with function body.
