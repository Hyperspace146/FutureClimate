extends Control

# CONSTRUCTION
onready var sqrFt = get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/SquareFootage")
onready var pplpRes = get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/PeoplePerResidence")
onready var bldngLifetime = get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/BuildingLifetime")
onready var bldngMaterial = get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/BuildingMaterial")
onready var insulation = get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/Insulation2")
onready var htClMethod = get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/HeatCoolMethod")
onready var climateZone = get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/ClimateZone")
#onready var battery = get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/BatterySize")
#onready var solarPanelSize = get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/SolarPanelSize")

# GROCERY
#onready var CalorieFractVege = get_node("CanvasLayer/GroceryPopUp/GrocerySliders/CalorieFractVege")
onready var FoodTransport = get_node("CanvasLayer/GroceryPopUp/FoodTransport")
onready var CalorieFractBeef = get_node("CanvasLayer/GroceryPopUp/GrocerySliders/CalorieFractBeef")
onready var CalorieFractPoultry = get_node("CanvasLayer/GroceryPopUp/GrocerySliders/CalorieFractPoultry")
onready var CalorieFractDairy =  get_node("CanvasLayer/GroceryPopUp/GrocerySliders/CalorieFractDairy")
onready var FractWaste = get_node("CanvasLayer/GroceryPopUp/GrocerySliders/FractWaste")
onready var processedFoodRatio = get_node("CanvasLayer/GroceryPopUp/GrocerySliders/FractProcessed")

# RESIDENCE from simon
onready var FridgeEnergyUsage = get_node("CanvasLayer/WaterPopUp/WaterSliders2/FridgeEnergyUsage")
onready var WaterUsage = get_node("CanvasLayer/WaterPopUp/WaterSliders2/WaterUsage")
onready var HotWater = get_node("CanvasLayer/WaterPopUp/WaterSliders/HotWaterHeater")
#onready var HeatedWater = get_node("CanvasLayer/WaterPopUp/WaterSliders/HeatedWater")
#onready var EnergyForCooking = get_node("CanvasLayer/CookingPopUp/CookingSliders/EnergyForCooking")
onready var stove = get_node("CanvasLayer/WaterPopUp/StoveType")
#onready var elecType = get_node("CanvasLayer/CookingPopUp/CookingSliders/Electricity")
onready var elecMix = get_node("CanvasLayer/CookingPopUp/CookingSliders/ElectricityMixManuf")
onready var showerLength = get_node("CanvasLayer/WaterPopUp/WaterSliders/ShowerLength")
onready var ClothesWashTemp = get_node("CanvasLayer/WaterPopUp/WaterSliders2/ClothesWashTemp")
onready var ClothesBought = get_node("CanvasLayer/WaterPopUp/WaterSliders2/ClothesBought")
#TECH 
onready var phoneUse = get_node("CanvasLayer/TechPopUp/TechSliders/PhoneUsage")
onready var phoneStandby = get_node("CanvasLayer/TechPopUp/TechSliders/PhoneUsageStandby")
onready var phoneLife = get_node("CanvasLayer/TechPopUp/TechSliders/PhoneLifetime")
onready var laptopUse = get_node("CanvasLayer/TechPopUp/TechSliders/LaptopUsage")
onready var laptopLife = get_node("CanvasLayer/TechPopUp/TechSliders/LaptopLifetime")

# SCHOOL
#onready var percentKids = get_node("CanvasLayer/SchoolPopUp/SchoolSliders/PercentKids")
onready var SchoolsqrFtPerStudent = get_node("CanvasLayer/ServicesPopUp/ServicesSliders/SchoolsqrFtPerStudent")
onready var PercentInsulated = get_node("CanvasLayer/ServicesPopUp/ServicesSliders/PercentWellInsulated")
onready var ServicesEnergyUsageForOther = get_node("CanvasLayer/ServicesPopUp/ServicesSliders/SchoolEnergyUsageForOther")

# HOSPITAL
onready var HospsqrFtPerPerson = get_node("CanvasLayer/ServicesPopUp/ServicesSliders/HospsqrFtPerPerson")
#onready var HospExtra = get_node("CanvasLayer/SchoolPopUp/SchoolSliders/HospExtra")

onready var CommercialArea = get_node("CanvasLayer/ServicesPopUp/ServicesSliders/CommercialArea")
#onready var CommercialPercent = get_node("CanvasLayer/CommercialPopUp/CommercialSliders/CommercialPercent")
#onready var ShippingBoat = get_node("CanvasLayer/CommercialPopUp/CommercialSliders/ShippingBoat")
onready var ShippingTotal = get_node("CanvasLayer/ServicesPopUp/ServicesSliders/ShippingTotal")
#onready var ShippingRoad = get_node("CanvasLayer/ServicesPopUp/ServicesSliders/ShippingRoad")

#mobility - Carmen
onready var distAIR = get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityAir")
onready var distBUS = get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityBus")
onready var distRAIL = get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityRail")
onready var distCAR = get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityCar")
onready var distNON = get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityNonMotorized") 

#efficiencies - Carmen
onready var perAIR = get_node("CanvasLayer/ReductionsPopUp/ReductionsSliders/EfficiencyAir")
onready var perBUS = get_node("CanvasLayer/ReductionsPopUp/ReductionsSliders/EfficiencyBus")
onready var perRAIL = get_node("CanvasLayer/ReductionsPopUp/ReductionsSliders/EfficiencyRail")
onready var perCAR = get_node("CanvasLayer/ReductionsPopUp/ReductionsSliders/EfficiencyCar2")
onready var typeCAR = get_node("CanvasLayer/ReductionsPopUp/CarType")
onready var sizeCAR = get_node("CanvasLayer/ReductionsPopUp/CarSize")
#Calculated quantities
var heating = 0
#var illumination = 0
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
onready var totalCH4 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
var coalco2 = 8.76/1000.0 #1 kg CO2/kWh = 8.76 kg CO2/yr/W, /1000 for units of tons
var gaselecco2 = 0.47*8.76/1000.0#@0.433 kg CO2/kWh* 8.76/1000.0 #https://onlinelibrary.wiley.com/doi/abs/10.1111/jiec.12084
#and https://www.nrel.gov/analysis/life-cycle-assessment.html
var gasch4 = 0.034/1000.0# (55 MJ/kg: 1 kg gas/yr=55 MJ/yr*1 yr/365/24/3600 s = 1.744 W
# 1 W requires 1/1.744 kg CH4, at 4% leakage rate, 0.04/1.744 kg CH4 = 34 g/W
# this is for 100% efficiency, e.g., a home heater. for power plant, divide by 0.6 (60% eff)
var gaselecch4 = gasch4/0.60 #60% eff

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# CONSTRUCTION
	sqrFt.min_value = 30 # square meters
	sqrFt.step = 5
	sqrFt.max_value = 750 # square meters
	sqrFt.value = 300
	var sqrFt0 = 300
	pplpRes.min_value = 1 # people
	pplpRes.max_value = 6 # people
	pplpRes.value = 2
	var pplpRes0 = 2
	bldngLifetime.min_value = 20 # years
	bldngLifetime.max_value = 100 # years
	bldngLifetime.value = 50
	var bldngLifetime0 = 50
#	insulation.min_value = 10 # kW hr / m^2 / year
#	insulation.max_value = 200 # kW hr / m^2 / year
#	insulation.value = 100
#	var insulation0 = 100
	climateZone.selected = 2
	insulation.selected = 1
	#elecType.selected = 1
	elecMix.min_value = 0.0
	elecMix.max_value = coalco2*1000.0
	elecMix.value = coalco2*700.0
	elecMix.step = 0.01
	#battery.min_value = 0 # kW hr
	#battery.max_value = 100 # kW hr
	#var battery0 = 0
	#solarPanelSize.min_value = 0 #  kW
	#solarPanelSize.max_value = 25 # kW
	#var solarPanelSize0 = 0
	
		# RESIDENCE from simon
	FridgeEnergyUsage.min_value = 14 # Watts
	FridgeEnergyUsage.max_value = 100 # Watts
	FridgeEnergyUsage.value = 68
	WaterUsage.min_value = 25 # liters / day
	WaterUsage.max_value = 500 # liters / day
	WaterUsage.value = 200
#	HeatedWater.min_value = 5 # liters / day
#	HeatedWater.max_value = 200 # liters / day
#	HeatedWater.value = 200
	showerLength.min_value = 0.0
	showerLength.max_value = 20.0
	showerLength.value = 8.0
	ClothesBought.value = 3.0
	ClothesBought.min_value = 3.0
	ClothesBought.max_value = 12.0
#	HotWaterTemp.min_value = 49.0
#	HotWaterTemp.max_value = 65.0
#	HotWaterTemp.value = 55.0
		
	#GROCERY
	FoodTransport.min_value = 50.0
	FoodTransport.max_value = 100.0
	FoodTransport.value = 100.0
	CalorieFractBeef.min_value = 0 # %
	CalorieFractBeef.max_value = 20 # %
	CalorieFractBeef.value = 4
	CalorieFractPoultry.min_value = 0 # %
	CalorieFractPoultry.max_value = 20 # %
	CalorieFractPoultry.value = 6
	CalorieFractDairy.min_value = 0 # %
	CalorieFractDairy.max_value = 20.0 # %
	CalorieFractDairy.value = 5.0
	FractWaste.min_value = 7.0 # %
	FractWaste.max_value = 70.0 # %
	FractWaste.value = 50.0
	processedFoodRatio.min_value = 35.0
	processedFoodRatio.max_value = 100.0
	processedFoodRatio.value = 100.0
	
	#Tech
	phoneUse.min_value = 0
	phoneUse.max_value = 18
	phoneUse.value = 4
	phoneStandby.min_value = 0
	phoneStandby.max_value = 24
	phoneStandby.value = 20
	phoneLife.min_value = 1
	phoneLife.max_value = 10
	phoneLife.value = 2
	laptopLife.min_value = 1
	laptopLife.max_value = 12
	laptopLife.value = 5
	laptopUse.min_value = 0
	laptopUse.max_value = 24
	laptopUse.value = 8
		#SCHOOL
	SchoolsqrFtPerStudent.min_value = 2.0 # %
	SchoolsqrFtPerStudent.max_value = 20.0 # %
	SchoolsqrFtPerStudent.value = 10.0
	#SchoolEmbodied.min_value = 4.0
	#SchoolEmbodied.max_value = 12.0
	#SchoolEmbodied.value = 4.0
	ServicesEnergyUsageForOther.min_value = 0
	ServicesEnergyUsageForOther.max_value = 40
	ServicesEnergyUsageForOther.value = 10
	#percentKids.min_value = 10.0
	#percentKids.max_value = 30.0
	#percentKids.value = 20.0
	PercentInsulated.value = 25.0
	PercentInsulated.min_value = 0.0
	PercentInsulated.max_value = 100.0
	CommercialArea.value = 25.0
	CommercialArea.min_value = 5.0
	CommercialArea.max_value = 30.0
	#ShippingRoad.value = 2.3
	#ShippingRoad.min_value = 0.0
	#ShippingRoad.max_value = 100.0
	ShippingTotal.value = 0.0
	ShippingTotal.min_value = 0.0
	ShippingTotal.max_value = 100.0
	#ShippingBoat.min_value = 0.0
	#ShippingBoat.max_value = 100.0
	#ShippingBoat.value = 0.0
	#ShippingIntensity.value = 
	#ShippingIntensity.min_value = 
	#ShippingIntensity.max_value = 
	
	#MEDICAL
	#1.6 m2/cap for other medical space
	HospsqrFtPerPerson.min_value = 0.0
	HospsqrFtPerPerson.max_value = 7.0
	HospsqrFtPerPerson.value = 5.0
	#HospExtra.min_value = 0
	#HospExtra.max_value = 45
	#HospExtra.value = 15
	
	#MOBILITY - Carmen
	distAIR.min_value = 0.0 #km
	distAIR.max_value = 50000 #km
	distAIR.value = 3679 #km
	distRAIL.min_value = 0.0 #km
	distRAIL.max_value = 50000 #km
	distRAIL.value = 191 #km
	distBUS.min_value = 0.0 #km
	distBUS.max_value = 50000 #km
	distBUS.value = 1855 #km
	distCAR.min_value = 0.0 #km
	distCAR.max_value = 50000 #km
	distCAR.value = 23980 #km
	distNON.min_value = 0 #km
	distNON.max_value = 25000 #km
	distNON.value = 137 #km
	
	#EFFICIENCIES - Carmen
	perAIR.min_value = 0.0
	perAIR.max_value = 1.2
	perAIR.value = 1.0
	perRAIL.min_value = 0.0
	perRAIL.max_value = 1.2
	perRAIL.value = 1.0
	perBUS.min_value = 0.0
	perBUS.max_value = 1.2
	perBUS.value = 1.0
	perCAR.min_value = 1
	perCAR.max_value = 4
	perCAR.value = 1.5 #https://css.umich.edu/publications/factsheets/mobility/personal-transportation-factsheet
		
	set_waterheatingcooking()
	set_energyForFoodChoice()
	set_heating()
	set_homeEmbodied()
	set_appliances()
	set_services()
	#set_embodied()
	set_mobility()
	totalpowercalc()
	
func totalpowercalc(): 
	#crank up 15% for energy infrastructure
	var total = 1.15*(totalPower[0] + totalPower[1] + totalPower[2] + totalPower[3] + totalPower[4] + totalPower[5] + totalPower[6] + totalPower[7])
	get_node("CanvasLayer/UICity/Total").text = str("%3.0f" % total) + " W"
	var totalel = (totalElec[0] + totalElec[1] + totalElec[2] + totalElec[3] + totalElec[4] + totalElec[5])
	#var elecCO2 = 0.0
	
	var totalc = (totalCO2[0] + totalCO2[1] + totalCO2[2] + totalCO2[3] + totalCO2[4] + totalCO2[5] + totalCO2[6] + totalCO2[7]) 
	get_node("CanvasLayer/CO2UICity/Total").text = str("%3.1f" % totalc) + " tons"
	var totalm = (totalCH4[0] + totalCH4[1] + totalCH4[2] + totalCH4[3] + totalCH4[4] + totalCH4[5] + totalCH4[6] + totalCH4[7])
	get_node("CanvasLayer/CO2UICity/MethaneLabel").text = "Methane: " + str("%3.2f" % totalm) + " t"
	
func set_energyForFoodChoice():
	var PTDFract = 150.0 + 20.0/100.0*get_node("CanvasLayer/GroceryPopUp/FoodTransport").value + 130.0/100.0*get_node("CanvasLayer/GroceryPopUp/GrocerySliders/FractProcessed").value
	energyForFoodChoice = (1.0 + FractWaste.value/100.0) * (100.0 * 0.2 * (1.0 + 23.0*CalorieFractBeef.value/100.0 + 10.0*CalorieFractPoultry.value/100.0 + 5.0*CalorieFractDairy.value/100.0) + 100.0 * 0.23 * (PTDFract)/100.0)
#food growing: fertilizer, fuel, equipment; food transport: fuel, refrigeration?; distribution: ?; processing: industrial
#
	var co2ForFoodChoice = gaselecco2*energyForFoodChoice
	var methaneForFoodChoice = (1.0 + FractWaste.value/100.0) * (CalorieFractBeef.value/100.0*2100.0/700.0*24.0 + CalorieFractDairy.value/100.0*2100.0/1000.0*5.0)/28.0*365.0/1000.0
	get_node("CanvasLayer/UICity/FoodLabel").text = "Food:   " + str("%3.0f" % energyForFoodChoice) + " W"
	totalPower[0] = energyForFoodChoice
	totalCO2[0] = energyForFoodChoice * gaselecco2
	get_node("CanvasLayer/CO2UICity/FoodLabel").text = "Food:   " + str("%3.1f" % co2ForFoodChoice) + " t"
	totalCH4[0] = methaneForFoodChoice + gaselecch4*energyForFoodChoice*elecMix.value/elecMix.max_value
	totalpowercalc()

#func set_energyForResidence():
#	energyForResidence = (sqrFt.value/pplpRes.value)*6 + (WaterUsage.value * 0.365 * EnergyForWater.value) + (HeatedWater.value * 4.42) + (100 * FractCooked.value * EnergyForCooking.value) + (FridgeEnergyUsage.value / pplpRes.value) + 2 + 0.4 
		# efficient heat pump not used
		# making a fridge + induction cooker
#	get_node("CanvasLayer/UICity/AppliancesLabel").text = "Res: " + str("%3.1f" % energyForResidence) + " Watts"

func set_heating():
	var CO2heating = 0
	var elecheating = 0
	var CH4heating = 0
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
	if (htClMethod.selected == 0): 
		CO2heating = 1.778 * heating/1000.0
		CH4heating = gasch4*heating/1000.0
	if (htClMethod.selected == 1): 
		elecheating = heating
	if (htClMethod.selected == 2): #heat pump
		heating = heating/5.0
		elecheating = heating
	get_node("CanvasLayer/UICity/HeatLabel").text = "Heat: " + str("%3.0f" % heating) + " W"
	totalPower[1] = heating
	totalElec[1] = elecheating
	CO2heating = CO2heating + elecMix.value/1000.0*elecheating
	totalCO2[1] = CO2heating
	totalCH4[1] = CH4heating + gaselecch4*elecMix.value/elecMix.max_value*elecheating
	get_node("CanvasLayer/CO2UICity/HeatLabel").text = "Heat: " + str("%3.1f" % CO2heating) + " t"
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
	get_node("CanvasLayer/UICity/HomeLabel").text = "Home: " + str("%3.0f" % homeEmbodied) + " W"
	totalPower[2] = homeEmbodied
	totalCO2[2] = CO2homeEmbodied
	totalCH4[2] = 0.0
	get_node("CanvasLayer/CO2UICity/HomeLabel").text = "Home: " + str("%3.1f" % CO2homeEmbodied) + " t"
	totalpowercalc()
		
func set_waterheatingcooking():
	var calories = (1.0 + FractWaste.value/100.0 )* (100.0) #Calories per day in watts
	var CO2cooking = 0.0
	var CH4cooking = 0.0
	var electriccooking = 0.0
	var FractCooked = 50.0
#	if (stove.selected == 0): #wood
#		cooking = calories * FractCooked/100.0 * 1.5 #approx 10 MJ/kg
	if (stove.selected == 0): #gas
		cooking = calories * FractCooked/100.0 * 0.956 #world average
		CO2cooking = cooking * 1.778/1000.0
		CH4cooking = cooking * gasch4
	if (stove.selected == 1): #electric
		cooking = calories * FractCooked/100.0 * 0.7 #higher efficiency
		electriccooking = cooking
	if (stove.selected == 2): #induction/pressure cooker
		cooking = calories * FractCooked /100.0* 0.4 #induction
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
		CH4cooking = CH4cooking + gasch4*waterheating
	if (HotWater.selected == 1): #electric hot water
		electriccooking = electriccooking + waterheating
	hotwatercook = waterheating + cooking
	get_node("CanvasLayer/UICity/HotWaterCookLabel").text = "Hot H2O: " + str("%3.0f" % hotwatercook) + " W"
	get_node("CanvasLayer/CO2UICity/HotWaterCookLabel").text = "Hot H2O: " + str("%3.1f" % CO2cooking) + " t"
	totalPower[3] = hotwatercook
	CO2cooking = CO2cooking + elecMix.value/1000.0*electriccooking
	CH4cooking = CH4cooking + gaselecch4*elecMix.value/elecMix.max_value*electriccooking
	totalCO2[3] = CO2cooking
	totalElec[3] = electriccooking
	totalCH4[3] = CH4cooking
	totalpowercalc()	

func set_services(): 
	#6 W for waste management, 5 W for cell phone networks, 25 W for laptop network -- all assumed electric
	#water: 20 L for clothes washing, plus shower. (this category measures delivery, we assume electric)
	#8 L/min shower * 10 min avg = 80 L
	var CO2services = 0.0
	var CH4services = 0.0
	var schmedEmb
	var waterfactor = 1.0
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
	#comm is same as school
	var school = (schmedEmb * SchoolsqrFtPerStudent.value + 3.0 * SchoolsqrFtPerStudent.value * 40.0*80.0/70.0/31.536)*0.2
#removed percentage of kids in school, replaced with 20%
#	var school = (schmedEmb* SchoolsqrFtPerStudent.value + SchoolEnergyUsageForOther.value + 3.0 * SchoolsqrFtPerStudent.value * 40.0*80.0/70.0/31.536)*percentKids.value/100.0
	var med = schmedEmb* HospsqrFtPerPerson.value + 9.0 * HospsqrFtPerPerson.value * 40.0*80.0/70.0/31.536 + ServicesEnergyUsageForOther.value
	var comm = schmedEmb* CommercialArea.value + 3.0 * CommercialArea.value * 40.0*80.0/70.0/31.536
	#bunker fuel: 40 MJ/kg, CO2 emissions
	services = 6.0 + (WaterUsage.value + showerLength.value * 8.0 + 20.0)*0.056*waterfactor + 5.0 + 25.0 + school + med + comm
	get_node("CanvasLayer/UICity/ServicesLabel").text = "Services:   " + str("%3.0f" % services) + " W"
	totalPower[5] = services
	CO2services = elecMix.value/1000.0*services
	get_node("CanvasLayer/CO2UICity/ServicesLabel").text = "Services:   " + str("%3.1f" % CO2services) + " t"
	CH4services = elecMix.value/elecMix.max_value*services*gaselecch4
	totalCO2[5] = CO2services
	totalCH4[5] = CH4services
	totalElec[5] = services
	totalpowercalc()
	
func set_mobility(): 
	var co2mobility = 0.0
	var ch4mobility = 0.0
	var emfCAR = 0.0
	var co2ratCAR = 0.0
	var ch4ratCAR = 0.0
	var co2CAR = 0.0
	var ch4CAR = 0.0
	#type: gas, diesel, hybrid, plug-in hybrid, electric
	#size: small, medium, large, extra-large
	if (typeCAR.selected == 0): #gas
		if (sizeCAR.selected == 0): #small
			emfCAR = 5.0*.342 #Le/100 km * 34.2 MJ/L /100 = MJ/km = GJ/1000 km
			co2ratCAR = 5.0*2.392*0.00001 #Le/100 km * 2.392 kg CO2/L /100 * 1 ton /1000 kg = ton CO2/km
		if (sizeCAR.selected == 1): #medium
			emfCAR = 7.5*.342 # GJ/kpkm
			co2ratCAR = 7.5*2.392*0.00001 #ton CO2/km
		if (sizeCAR.selected == 2): #large
			emfCAR = 10.0*.342 #GJ/kpkm
			co2ratCAR = 10.0*2.392*0.00001 #ton CO2/km
		if (sizeCAR.selected == 3): #extra large
			emfCAR = 12.5*.342 #GJ/kpkm
			co2ratCAR = 12.5*2.392*0.00001 #ton CO2/km
	if (typeCAR.selected == 1): #diesel
		if (sizeCAR.selected == 0): #small
			emfCAR = 4.0*.342 #GJ/kpkm
			co2ratCAR = 4.0*2.640*0.00001 #ton CO2/km
		if (sizeCAR.selected == 1): #medium
			emfCAR = 6.0*.342 #GJ/kpkm
			co2ratCAR = 6.0*2.64*0.00001 #ton CO2/km
		if (sizeCAR.selected == 2): #large
			emfCAR = 8.0*.342 #GJ/kpkm
			co2ratCAR = 8.0*2.64*0.00001 #ton CO2/km
		if (sizeCAR.selected == 3): #extra large
			emfCAR = 10.0*.342 #GJ/kpkm
			co2ratCAR = 10.0*2.64*0.00001 #ton CO2/km
	if (typeCAR.selected == 2): #hybrod
		if (sizeCAR.selected == 0): #small
			emfCAR = 4.0*.342 #GJ/kpkm
			co2ratCAR = 4.0*2.392*0.00001 #ton CO2/km
		if (sizeCAR.selected == 1): #medium
			emfCAR = 6.0*.342 #GJ/kpkm
			co2ratCAR = 6.0*2.392*0.00001 #ton CO2/km
		if (sizeCAR.selected == 2): #large
			emfCAR = 8.0*.342 #GJ/kpkm
			co2ratCAR = 8.0*2.392*0.00001 #ton CO2/km
		if (sizeCAR.selected == 3): #extra large
			emfCAR = 9.5*.342 #GJ/kpkm
			co2ratCAR = 9.5*2.392*0.00001 #ton CO2/km
	if (typeCAR.selected == 3): #plug-in hybrid
		if (sizeCAR.selected == 0): #small
			emfCAR = 2.0*.342 #GJ/kpkm
			co2ratCAR = 0.67*2.0*2.392*0.00001 #ton CO2/km
		if (sizeCAR.selected == 1): #medium
			emfCAR = 2.5*.342 #GJ/kpkm
			co2ratCAR = 0.67*2.5*2.392*0.00001 #ton CO2/km
		if (sizeCAR.selected == 2): #large
			emfCAR = 3.0*.342 #GJ/kpkm
			co2ratCAR = 0.67*3.0*2.392*0.00001 #ton CO2/km
		if (sizeCAR.selected == 3): #extra large
			emfCAR = 3.5*.342 #GJ/kpkm
			co2ratCAR = 0.67*3.5*2.392*0.00001
		#arbitrarily picking a 67% gas and 33% electricity mix. note this means much more electric driving
		co2ratCAR = co2ratCAR + elecMix.value/1000.0*0.33*emfCAR*0.0315 #
		ch4ratCAR = elecMix.value/elecMix.max_value*0.33*emfCAR*0.0315*gaselecch4
	if (typeCAR.selected == 4): #electric
		if (sizeCAR.selected == 0): #small
			emfCAR = 1.5*.342 #GJ/kpkm
		if (sizeCAR.selected == 1): #medium
			emfCAR = 1.8*.342 #GJ/kpkm
		if (sizeCAR.selected == 2): #large
			emfCAR = 2.2*.342 #GJ/kpkm
		if (sizeCAR.selected == 3): #extra large
			emfCAR = 2.5*.342 #GJ/kpkm
		co2ratCAR = elecMix.value/1000.0*emfCAR*0.0315
		ch4ratCAR = elecMix.value/elecMix.max_value*emfCAR*0.0315*gaselecch4
	emfCAR=emfCAR+0.21 + perBUS.value*(0.77-0.21)#MJ/km, minimum energy, today is 0.48-0.77
	co2ratCAR = co2ratCAR + (0.21 + perBUS.value*(0.77-0.21))*elecMix.value/1000.0*0.0315
	ch4ratCAR = ch4ratCAR + (0.21 + perBUS.value*(0.77-0.21))*elecMix.value/elecMix.max_value*0.0315*gaselecch4
	var emfAIR = 1.17 + perAIR.value*(2.0-1.17)#MJ/km, minimum energy, today is 2
	var emfRAIL =  0.287 +perRAIL.value*(1.12-0.287)#MJ/km, minimum energy, today is 0.27-1.12
	var emfBUS = 0.27 +perBUS.value*(1.38-0.27)#MJ/km, minimum energy, today is 0.54-1.38
	var co2ratRAIL = emfRAIL*elecMix.value/1000.0*0.0315
	var ch4ratRAIL = emfRAIL*elecMix.value/elecMix.max_value*0.0315*gaselecch4
	#Bus should probably be diesel to electric
	var co2ratBUS = emfBUS*elecMix.value/1000.0*0.0315
	var ch4ratBUS = emfBUS*elecMix.value/elecMix.max_value*0.0315*gaselecch4
	#var emfCAR = 0.56 #MJ/km, minimum energy, today is 1.58-3.17
	#gas: 46.4 MJ/kg, diesel: 45.7 MJ/kg; co2 emissions gas: 3.3 kg CO2/kg gas, diesel: 3.15 kg CO2/kg diesel
	var emfNON = 0 #MJ/km
	var EngrAIR = distAIR.value*emfAIR*0.0315 #/(perAIR.value/100)
	co2mobility = distAIR.value*emfAIR/42.8*3.15/1000.0 #air, using kerosene energy content of 42.8 MJ/kg and 3.15 kg CO2/kg kerosene
	var EngrRAIL = distRAIL.value*emfRAIL*0.0315 #/(perRAIL.value/100)
	var EngrBUS = distBUS.value*emfBUS*0.0315 #/(perBUS.value/100)
	var EngrCAR = distCAR.value*emfCAR*0.0315/(perCAR.value)
	co2mobility = co2mobility + distCAR.value*co2ratCAR/(perCAR.value) + distBUS.value*co2ratBUS + distRAIL.value*co2ratRAIL
	var EngrNON = distNON.value*emfNON*0.0315
	var mobility = EngrAIR + EngrRAIL + EngrBUS + EngrCAR + EngrNON
	get_node("CanvasLayer/UICity/MobilityLabel").text = "Mobility: " + str("%3.0f" % mobility) + " W"
	totalPower[6] = mobility
	totalCO2[6] = co2mobility
	totalpowercalc()
	get_node("CanvasLayer/CO2UICity/MobilityLabel").text = "Mobility: " + str("%3.1f" % co2mobility) + " t"
	
func set_appliances(): 
	var CO2embodied = 0.0
	#shared: 8 W for a fridge with 14 year lifetime, 1.6 W for cooking with 20 year lifetime)
	#indiv: 7 W-yr for phone
	# assuming 12 W (30 W) for new clothes based on best (current) numbers
	var clothesemb = ClothesBought.value /3.0 * 12.0 
	var embodied = (8.0+ 1.6)/pplpRes.value + 7.0/phoneLife.value + 120.0/laptopLife.value +clothesemb
	#get_node("CanvasLayer/UICity/EmbodiedLabel").text = "Embodied: " + str("%3.0f" % embodied) + " W"
	#totalPower[4] = embodied
	#totalElec[4] = embodied
	#CO2embodied = elecMix.value/1000.0*embodied
	#totalCO2[4] = CO2embodied
	#totalpowercalc()
	#get_node("CanvasLayer/CO2UICity/EmbodiedLabel").text = "Embodied: " + str("%3.1f" % CO2embodied) + " t"
	var CO2appliances = 0.0
	var CH4appliances = 0.0
	var lighttime = 6.0/24.0 #lights on per day
	var lightpercent = 0.33 #percent of residence that's lit
	var brightness = 1.0 #watts per meter squared
	var lightefficiency = 0.2 # for incandescent
	var illumination = sqrFt.value/pplpRes.value * lighttime * lightpercent * brightness / lightefficiency
	var appliances = FridgeEnergyUsage.value/pplpRes.value + phoneUse.value*5.0/24.0 + phoneStandby.value*1.0/24.0 + laptopUse.value*100.0/24.0 + illumination + embodied
	get_node("CanvasLayer/UICity/AppliancesLabel").text = "Appliance: " + str("%3.0f" % appliances) + " W"
	totalPower[7] = appliances
	totalElec[7] = appliances
	CO2appliances = elecMix.value/1000.0*appliances
	CH4appliances = elecMix.value/elecMix.max_value*gaselecch4*appliances
	get_node("CanvasLayer/CO2UICity/AppliancesLabel").text = "Appliance: " + str("%3.1f" % CO2appliances) + " t"
	totalCO2[7] = CO2appliances
	totalCH4[7] = CH4appliances
	totalpowercalc()

func _on_CalorieFractBeef_value_changed(value):
	set_energyForFoodChoice()
	get_node("CanvasLayer/GroceryPopUp/GrocerySliders/CalorieFractBeef/Label2").text = str("%3.1f" % CalorieFractBeef.value) + "%"

func _on_CalorieFractPoultry_value_changed(value):
	set_energyForFoodChoice()
	get_node("CanvasLayer/GroceryPopUp/GrocerySliders/CalorieFractPoultry/Label2").text = str("%3.1f" % CalorieFractPoultry.value) + "%"
	
func _on_CalorieFractDairy_value_changed(value):
	set_energyForFoodChoice()
	get_node("CanvasLayer/GroceryPopUp/GrocerySliders/CalorieFractDairy/Label2").text = str("%3.1f" % CalorieFractDairy.value) + "%"

func _on_FractWaste_value_changed(value):
	set_energyForFoodChoice()
	get_node("CanvasLayer/GroceryPopUp/GrocerySliders/FractWaste/Label2").text = str("%3.1f" % FractWaste.value) + "%"

func _on_FractLocal_value_changed(value):
	set_energyForFoodChoice()
	get_node("CanvasLayer/GroceryPopUp/FoodTransport/Label2").text = str("%1.2f" % (FoodTransport.value/100.0)) + " X"

func _on_FractProcessed_value_changed(value):
	set_energyForFoodChoice()
	get_node("CanvasLayer/GroceryPopUp/GrocerySliders/FractProcessed/Label2").text = str("%1.2f" % (processedFoodRatio.value/100.0)) + " X"
	
func _on_SquareFootage_value_changed(value):
	#affects heating, home_embodied, illumination
	set_heating()
	set_appliances()
	set_homeEmbodied()
	get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/SquareFootage/Label").text = str(sqrFt.value) + " sq meters per residence"

func _on_PeoplePerResidence_value_changed(value):
	#affects appliances: refrigerator, stove, embodied energy of home, 
	set_heating() 
	set_homeEmbodied()
	set_appliances()
	get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/PeoplePerResidence/Label").text = str(pplpRes.value) + " people per residence"
	if value == 1: 
		get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/PeoplePerResidence/Label").text = str(pplpRes.value) + " person per residence"

func _on_BuildingLifetime_value_changed(value):
	#affect embodied energy of home
	set_homeEmbodied()
	get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/BuildingLifetime/Label").text = str(bldngLifetime.value) + " yr lifetime of building"

func _on_ToGrocery_pressed():
	get_node("CanvasLayer/ConstructionPopUp").visible = false
	get_node("CanvasLayer/GroceryPopUp").visible = true
	get_node("CanvasLayer/GroceryPopUp").rect_position = Vector2(29,160)

func _on_ToResidence_pressed():
	get_node("CanvasLayer/GroceryPopUp").visible = false
	get_node("CanvasLayer/WaterPopUp").visible = true
	get_node("CanvasLayer/WaterPopUp").rect_position = Vector2(29,160)

func _on_HeatCoolMethod_item_selected(id):
	set_heating()
	
func _on_BuildingMaterial_item_selected(id):
	set_homeEmbodied()

func _on_ClimateZone_item_selected(id):
	set_heating()
	set_waterheatingcooking()

func _on_ToCooking_pressed():
	get_node("CanvasLayer/WaterPopUp").visible = false
	get_node("CanvasLayer/CookingPopUp").visible = true
	get_node("CanvasLayer/CookingPopUp").rect_position = Vector2(29,160)

func _on_WaterUsage_value_changed(value):
	set_services()
	get_node("CanvasLayer/WaterPopUp/WaterSliders2/WaterUsage/Label").text = "Other water usage =         " + str(value) + " L"

func _on_HeatedWater_value_changed(value):
	set_waterheatingcooking()
	get_node("CanvasLayer/WaterPopUp/WaterSliders/HeatedWater/Label").text = "Other heated water =         " + str(value) + " L"

func _on_StoveType_item_selected(id):
	set_waterheatingcooking()

func _on_FridgeEnergyUsage_value_changed(value):
	set_appliances()
	get_node("CanvasLayer/WaterPopUp/WaterSliders2/FridgeEnergyUsage/Label").text = "Fridge energy usage = " + str(value) + " W"

func _on_ShowerLength_value_changed(value):
	set_waterheatingcooking()
	set_services()
	get_node("CanvasLayer/WaterPopUp/WaterSliders/ShowerLength/Label").text = "Hot shower length = " + str(value) + " min/day"

func _on_Insulation2_item_selected(id):
	set_heating()

func _on_Hotwatertemp_value_changed(value):
	set_waterheatingcooking()
	var tempf = round(value*9.0/5.0 + 32.0)
	get_node("CanvasLayer/WaterPopUp/WaterSliders/Hotwatertemp/Label").text = "Hot water temp = " + str(value) + " C (" + str(tempf) + ") F"

func _on_ClothesWashTemp_item_selected(id):
	set_waterheatingcooking()

func _on_ToTech_pressed():
	get_node("CanvasLayer/CookingPopUp").visible = false
	get_node("CanvasLayer/TechPopUp").visible = true
	get_node("CanvasLayer/TechPopUp").rect_position = Vector2(29,160)

func _on_PhoneUsage_value_changed(value):
	set_appliances()
	get_node("CanvasLayer/TechPopUp/TechSliders/PhoneUsage/Label").text = "Phone usage: " + str(value) + " hrs/day"
	if (value == 1 ): 
		get_node("CanvasLayer/TechPopUp/TechSliders/PhoneUsage/Label").text = "Phone usage: " + str(value) + " hr/day"

func _on_PhoneUsageStandby_value_changed(value):
	set_appliances()
	get_node("CanvasLayer/TechPopUp/TechSliders/PhoneUsageStandby/Label").text = "Phone usage (standby): " + str(value) + " hrs/day"
	if (value == 1 ): 
			get_node("CanvasLayer/TechPopUp/TechSliders/PhoneUsageStandby/Label").text = "Phone usage (standby): " + str(value) + " hr/day"

func _on_PhoneLifetime_value_changed(value):
	set_appliances()
	get_node("CanvasLayer/TechPopUp/TechSliders/PhoneLifetime/Label").text = "Phone lifetime: " + str(value) + " years"
	if (value == 1): 
		get_node("CanvasLayer/TechPopUp/TechSliders/PhoneLifetime/Label").text = "Phone lifetime: " + str(value) + " year"

func _on_LaptopUsage_value_changed(value):
	set_appliances()
	get_node("CanvasLayer/TechPopUp/TechSliders/LaptopUsage/Label").text = "Laptop/TV usage: " + str(value) + " hrs/day"
	if (value == 1): 
		get_node("CanvasLayer/TechPopUp/TechSliders/LaptopUsage/Label").text = "Laptop/TV usage: " + str(value) + " hr/day"

func _on_LaptopLifetime_value_changed(value):
	set_appliances()
	get_node("CanvasLayer/TechPopUp/TechSliders/LaptopLifetime/Label").text = "Laptop lifetime: " + str(value) + " years"
	if (value == 1): 
		get_node("CanvasLayer/TechPopUp/TechSliders/LaptopLifetime/Label").text = "Laptop lifetime: " + str(value) + " year"

func _on_ToSchool_pressed():
	get_node("CanvasLayer/TechPopUp").visible = false
	get_node("CanvasLayer/ServicesPopUp").visible = true
	get_node("CanvasLayer/ServicesPopUp").rect_position = Vector2(29,160)

func _on_SchoolsqrFtPerStudent_value_changed(value):
	set_services()
	get_node("CanvasLayer/ServicesPopUp/ServicesSliders/SchoolsqrFtPerStudent/Label").text = str(value) + " square meters per student"

func _on_ToResidence2_pressed():
	get_node("CanvasLayer/SchoolPopUp").visible = false
	get_node("CanvasLayer/ServicesPopUp").visible = true
	get_node("CanvasLayer/ServicesPopUp").rect_position = Vector2(29,160)

func _on_SchoolEnergyUsageForOther_value_changed(value):
	set_services()
	get_node("CanvasLayer/ServicesPopUp/ServicesSliders/SchoolEnergyUsageForOther/Label").text = "Extra energy usage for schools/hospitals: " + str(value) + " W"

func _on_HospsqrFtPerPerson_value_changed(value):
	set_services()
	get_node("CanvasLayer/ServicesPopUp/ServicesSliders/HospsqrFtPerPerson/Label").text = "Medical floor area: " + str(value) + " square meters per person"

func _on_PercentWellInsulated_value_changed(value):
	set_services()
	get_node("CanvasLayer/ServicesPopUp/ServicesSliders/PercentWellInsulated/Label").text = "Well-insulated buildings w/ heat pumps: " + str(value) + "%"

func _on_CommercialArea_value_changed(value):
	set_services()
	get_node("CanvasLayer/ServicesPopUp/ServicesSliders/CommercialArea/Label").text = "Commercial area per person: " + str(value) + " square meters"

func _on_ToMobility_pressed():
	get_node("CanvasLayer/ServicesPopUp").visible = false
	get_node("CanvasLayer/MobilityPopUp").visible = true
	get_node("CanvasLayer/MobilityPopUp").rect_position = Vector2(29,160)
	
func _on_ToBeginning_pressed():
	get_node("CanvasLayer/ReductionsPopUp").visible = false
	get_node("CanvasLayer/ConstructionPopUp").visible = true
	get_node("CanvasLayer/ConstructionPopUp").rect_position = Vector2(29,160)

func _on_ClothesBought_value_changed(value):
	set_appliances()
	get_node("CanvasLayer/WaterPopUp/WaterSliders2/ClothesBought/Label").text = "Clothes bought: " + str(value) + " outfits per year"
	pass # Replace with function body.

	#MOBILITY LABELS - Carmen
func _on_MobilityAir_value_changed(value):
	var totalmobility = distAIR.value + distRAIL.value + distBUS.value + distCAR.value + distNON.value
	var percentAirTravel = distAIR.value / totalmobility * 100.0
	var percentBusTravel = distBUS.value / totalmobility * 100.0
	var percentRailTravel = distRAIL.value /totalmobility * 100.0
	var percentCarTravel = distCAR.value / totalmobility * 100.0
	var percentNonMotorizedTravel = distNON.value / totalmobility * 100.0
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityAir/Label2").text = str("%1.2f" % percentAirTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityBus/Label2").text = str("%1.2f" % percentBusTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityRail/Label2").text = str("%1.2f" % percentRailTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityCar/Label2").text = str("%1.2f" % percentCarTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityNonMotorized/Label2").text = str("%1.2f" % percentNonMotorizedTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityAir/Label").text = "Distance travelled by air: " + str(value) + " km/year"
	set_mobility()

func _on_MobilityBus_value_changed(value):
	var totalmobility = distAIR.value + distRAIL.value + distBUS.value + distCAR.value + distNON.value
	var percentAirTravel = distAIR.value / totalmobility * 100.0
	var percentBusTravel = distBUS.value / totalmobility * 100.0
	var percentRailTravel = distRAIL.value /totalmobility * 100.0
	var percentCarTravel = distCAR.value / totalmobility * 100.0
	var percentNonMotorizedTravel = distNON.value / totalmobility * 100.0
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityAir/Label2").text = str("%1.2f" % percentAirTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityBus/Label2").text = str("%1.2f" % percentBusTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityRail/Label2").text = str("%1.2f" % percentRailTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityCar/Label2").text = str("%1.2f" % percentCarTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityNonMotorized/Label2").text = str("%1.2f" % percentNonMotorizedTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityBus/Label").text = "Distance travelled by bus: " + str(value) + " km/year"
	set_mobility()


func _on_MobilityRail_value_changed(value):
	var totalmobility = distAIR.value + distRAIL.value + distBUS.value + distCAR.value + distNON.value
	var percentAirTravel = distAIR.value / totalmobility * 100.0
	var percentBusTravel = distBUS.value / totalmobility * 100.0
	var percentRailTravel = distRAIL.value /totalmobility * 100.0
	var percentCarTravel = distCAR.value / totalmobility * 100.0
	var percentNonMotorizedTravel = distNON.value / totalmobility * 100.0
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityAir/Label2").text = str("%1.2f" % percentAirTravel) + "% total distance traveled"	
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityBus/Label2").text = str("%1.2f" % percentBusTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityRail/Label2").text = str("%1.2f" % percentRailTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityCar/Label2").text = str("%1.2f" % percentCarTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityNonMotorized/Label2").text = str("%1.2f" % percentNonMotorizedTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityRail/Label").text = "Distance travelled by rail: " + str(value) + " km/year"
	set_mobility()

func _on_MobilityCar_value_changed(value):
	var totalmobility = distAIR.value + distRAIL.value + distBUS.value + distCAR.value + distNON.value
	var percentAirTravel = distAIR.value / totalmobility * 100.0
	var percentBusTravel = distBUS.value / totalmobility * 100.0
	var percentRailTravel = distRAIL.value /totalmobility * 100.0
	var percentCarTravel = distCAR.value / totalmobility * 100.0
	var percentNonMotorizedTravel = distNON.value / totalmobility * 100.0
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityAir/Label2").text = str("%1.2f" % percentAirTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityBus/Label2").text = str("%1.2f" % percentBusTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityRail/Label2").text = str("%1.2f" % percentRailTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityCar/Label2").text = str("%1.2f" % percentCarTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityNonMotorized/Label2").text = str("%1.2f" % percentNonMotorizedTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityCar/Label").text = "Distance travelled by car: " + str(value) + " km/year"
	set_mobility()

func _on_MobilityNonMotorized_value_changed(value):
	var totalmobility = distAIR.value + distRAIL.value + distBUS.value + distCAR.value + distNON.value
	var percentAirTravel = distAIR.value / totalmobility * 100.0
	var percentBusTravel = distBUS.value / totalmobility * 100.0
	var percentRailTravel = distRAIL.value /totalmobility * 100.0
	var percentCarTravel = distCAR.value / totalmobility * 100.0
	var percentNonMotorizedTravel = distNON.value / totalmobility * 100.0
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityAir/Label2").text = str("%1.2f" % percentAirTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityBus/Label2").text = str("%1.2f" % percentBusTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityRail/Label2").text = str("%1.2f" % percentRailTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityCar/Label2").text = str("%1.2f" % percentCarTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityNonMotorized/Label2").text = str("%1.2f" % percentNonMotorizedTravel) + "% total distance traveled"
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityNonMotorized/Label").text = "Non-motorized travel distance: " + str(value) + " km/year"
	set_mobility()

#EFFICIENCY labels - Carmen
func _on_EfficiencyAir_value_changed(value):
	get_node("CanvasLayer/ReductionsPopUp/ReductionsSliders/EfficiencyAir/Label2").text = str("%1.1f" %value) + "% reduction in energy use"
	set_mobility()

func _on_EfficiencyBus_value_changed(value):
	get_node("CanvasLayer/ReductionsPopUp/ReductionsSliders/EfficiencyBus/Label2").text = str("%1.1f" %value) + "% reduction in energy use"
	set_mobility()

func _on_EfficiencyRail_value_changed(value):
	get_node("CanvasLayer/ReductionsPopUp/ReductionsSliders/EfficiencyRail/Label2").text = str("%1.1f" %value) + "% reduction in energy use"
	set_mobility()
	
func _on_EfficiencyCar_value_changed(value):
	get_node("CanvasLayer/ReductionsPopUp/ReductionsSliders/EfficiencyCar2/Label2").text = str("%1.1f" %value) + " passengers per car"
	set_mobility()
	
func _on_CO2Button_pressed():
	get_node("CanvasLayer/CO2UICity").visible = true
	get_node("CanvasLayer/UICity").visible = false

func _on_PowerButton_pressed():
	get_node("CanvasLayer/CO2UICity").visible = false
	get_node("CanvasLayer/UICity").visible = true

func _on_ToMobility2_pressed():
	get_node("CanvasLayer/MobilityPopUp").visible = true
	get_node("CanvasLayer/MobilityPopUp").rect_position = Vector2(29,160)
	get_node("CanvasLayer/ReductionsPopUp").visible = false

func _on_ToConstruction2_pressed():
	get_node("CanvasLayer/ConstructionPopUp").visible = true
	get_node("CanvasLayer/ConstructionPopUp").rect_position = Vector2(29,160)
	get_node("CanvasLayer/GroceryPopUp").visible = false
	
func _on_ToGrocery2_pressed():
	get_node("CanvasLayer/GroceryPopUp").visible = true
	get_node("CanvasLayer/GroceryPopUp").rect_position = Vector2(29,160)
	get_node("CanvasLayer/WaterPopUp").visible = false
	
func _on_ToWater2_pressed():
	get_node("CanvasLayer/WaterPopUp").visible = true
	get_node("CanvasLayer/WaterPopUp").rect_position = Vector2(29,160)
	get_node("CanvasLayer/CookingPopUp").visible = false

func _on_ToCooking2_pressed():
	get_node("CanvasLayer/CookingPopUp").visible = true
	get_node("CanvasLayer/CookingPopUp").rect_position = Vector2(29,160)
	get_node("CanvasLayer/TechPopUp").visible = false

func _on_ToTech2_pressed():
	get_node("CanvasLayer/TechPopUp").visible = true
	get_node("CanvasLayer/TechPopUp").rect_position = Vector2(29,160)
	get_node("CanvasLayer/SchoolPopUp").visible = false

func _on_ToSchool2_pressed():
	get_node("CanvasLayer/TechPopUp").visible = true
	get_node("CanvasLayer/TechPopUp").rect_position = Vector2(29,160)
	get_node("CanvasLayer/ServicesPopUp").visible = false
	
func _on_ToCommercial2_pressed():
	get_node("CanvasLayer/ServicesPopUp").visible = true
	get_node("CanvasLayer/ServicesPopUp").rect_position = Vector2(29,160)
	get_node("CanvasLayer/MobilityPopUp").visible = false

#func _on_Electricity_item_selected(id):
#	set_heating()
#	set_appliances()
#	set_embodied()
#	set_mobility()
#	set_waterheatingcooking()
#	set_energyForFoodChoice()
#	set_homeEmbodied()
#	set_services()

func _on_ToReductions_pressed():
	get_node("CanvasLayer/ReductionsPopUp").visible = true
	get_node("CanvasLayer/ReductionsPopUp").rect_position = Vector2(29,160)
	get_node("CanvasLayer/MobilityPopUp").visible = false

func _on_ToReductions2_pressed():
	get_node("CanvasLayer/ReductionsPopUp").visible = true
	get_node("CanvasLayer/ReductionsPopUp").rect_position = Vector2(29,160)
	get_node("CanvasLayer/ConstructionPopUp").visible = false

func _on_CarType_item_selected(id):
	set_mobility()

func _on_ElectricityMixManuf_value_changed(value):
	set_heating()
	set_appliances()
	#set_embodied()
	set_mobility()
	set_waterheatingcooking()
	set_energyForFoodChoice()
	set_homeEmbodied()
	set_services()


func _on_HelpButton2_pressed():
	get_node("CanvasLayer/HelpButton2").visible = false



func _on_HelpButton_pressed():
	get_node("CanvasLayer/HelpButton2").visible = true
	pass # Replace with function body.


func _on_HelpButton3_pressed():
		# CONSTRUCTION
	sqrFt.value = 60
	pplpRes.value = 4
	bldngLifetime.value = 80
	climateZone.selected = 0
	insulation.selected = 3
	bldngMaterial.selected = 0
	htClMethod.selected = 2
	
	elecMix.value = 0.0
	
		# RESIDENCE from simon
	FridgeEnergyUsage.value = 14
	WaterUsage.value = 35
	showerLength.value = 2.5
	ClothesBought.value = 3.0
	stove.selected = 2
	ClothesWashTemp.selected = 2
	HotWater.selected = 1
	
		
	#GROCERY
	FoodTransport.value = 50.0
	CalorieFractBeef.value = 1
	CalorieFractPoultry.value = 3
	CalorieFractDairy.value = 3.0
	FractWaste.value = 15.0
	processedFoodRatio.value = 35.0
	
	#Tech
	phoneUse.value = 4
	phoneStandby.value = 12
	phoneLife.value = 5
	laptopLife.value = 10
	laptopUse.value = 4
		#SCHOOL
	SchoolsqrFtPerStudent.value = 10.0
	ServicesEnergyUsageForOther.value = 10
	PercentInsulated.value = 100.0
	CommercialArea.value = 5.0
	ShippingTotal.value = 0.0
	
	#MEDICAL
	HospsqrFtPerPerson.value = 1.6
	
	#MOBILITY - Carmen
	distAIR.value = 1000 #km
	distRAIL.value =2000 #km
	distBUS.value = 2000 #km
	distCAR.value = 1000 #km
	distNON.value = 1000 #km
	
	#EFFICIENCIES - Carmen
	perAIR.value = 0.0
	perRAIL.value = 0.0
	perBUS.value = 0.0
	perCAR.value = 3
	typeCAR.selected = 4
	set_waterheatingcooking()
	set_energyForFoodChoice()
	set_heating()
	set_homeEmbodied()
	set_appliances()
	set_services()
	#set_embodied()
	set_mobility()
	totalpowercalc()

		
	get_node("CanvasLayer/HelpButton2").visible = false


func _on_HelpButton4_pressed():
	
		# CONSTRUCTION
	sqrFt.value = 200
	pplpRes.value = 2
	bldngLifetime.value = 50
	climateZone.selected = 2
	insulation.selected = 2
	elecMix.value = coalco2*600.0
	
		# RESIDENCE from simon
	FridgeEnergyUsage.value = 50
	WaterUsage.value = 200
	showerLength.value = 10.0
	ClothesBought.value = 4.0
	stove.selected = 0
	ClothesWashTemp.selected = 1
	HotWater.selected = 0
	
		
	#GROCERY
	FoodTransport.value = 100.0
	CalorieFractBeef.value = 5
	CalorieFractPoultry.value = 7
	CalorieFractDairy.value = 6.0
	FractWaste.value = 50.0
	processedFoodRatio.value = 100.0
	
	#Tech
	phoneUse.value = 4
	phoneStandby.value = 20
	phoneLife.value = 2
	laptopLife.value = 3
	laptopUse.value = 8
		#SCHOOL
	SchoolsqrFtPerStudent.value = 10.0
	ServicesEnergyUsageForOther.value = 10
	PercentInsulated.value = 25.0
	CommercialArea.value = 25.0
	ShippingTotal.value = 0.0
	
	#MEDICAL
	HospsqrFtPerPerson.value = 5.0
	
	#MOBILITY - Carmen
	distAIR.value = 3679 #km
	distRAIL.value = 191 #km
	distBUS.value = 1855 #km
	distCAR.value = 23980 #km
	distNON.value = 137 #km
	
	#EFFICIENCIES - Carmen
	perAIR.value = 1.0
	perRAIL.value = 1.0
	perBUS.value = 1.0
	perCAR.value = 1.5 #https://css.umich.edu/publications/factsheets/mobility/personal-transportation-factsheet
	
	typeCAR.selected = 0
	sizeCAR.selected = 3
	set_waterheatingcooking()
	set_energyForFoodChoice()
	set_heating()
	set_homeEmbodied()
	set_appliances()
	set_services()
	#set_embodied()
	set_mobility()
	totalpowercalc()

	get_node("CanvasLayer/HelpButton2").visible = false
