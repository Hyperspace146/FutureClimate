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
onready var localFoodRatio = get_node("CanvasLayer/GroceryPopUp/GrocerySliders/FractLocal")
onready var CalorieFractBeef = get_node("CanvasLayer/GroceryPopUp/GrocerySliders/CalorieFractBeef")
onready var CalorieFractPoultry = get_node("CanvasLayer/GroceryPopUp/GrocerySliders/CalorieFractPoultry")
onready var CalorieFractDairy =  get_node("CanvasLayer/GroceryPopUp/GrocerySliders/CalorieFractDairy")
onready var FractWaste = get_node("CanvasLayer/GroceryPopUp/GrocerySliders/FractWaste")
onready var processedFoodRatio = get_node("CanvasLayer/GroceryPopUp/GrocerySliders/FractProcessed")

# RESIDENCE from simon
onready var FractCooked = get_node("CanvasLayer/CookingPopUp/CookingSliders/FractCooked")
onready var FridgeEnergyUsage = get_node("CanvasLayer/CookingPopUp/CookingSliders/FridgeEnergyUsage")
onready var WaterUsage = get_node("CanvasLayer/WaterPopUp/WaterSliders/WaterUsage")
#onready var HeatedWater = get_node("CanvasLayer/WaterPopUp/WaterSliders/HeatedWater")
#onready var EnergyForCooking = get_node("CanvasLayer/CookingPopUp/CookingSliders/EnergyForCooking")
onready var stove = get_node("CanvasLayer/CookingPopUp/CookingSliders/StoveType")
onready var showerLength = get_node("CanvasLayer/WaterPopUp/WaterSliders/ShowerLength")
onready var ClothesWashTemp = get_node("CanvasLayer/WaterPopUp/WaterSliders/ClothesWashTemp")
onready var ClothesBought = get_node("CanvasLayer/WaterPopUp/WaterSliders/ClothesBought")
#TECH 
onready var phoneUse = get_node("CanvasLayer/TechPopUp/TechSliders/PhoneUsage")
onready var phoneStandby = get_node("CanvasLayer/TechPopUp/TechSliders/PhoneUsageStandby")
onready var phoneLife = get_node("CanvasLayer/TechPopUp/TechSliders/PhoneLifetime")
onready var laptopUse = get_node("CanvasLayer/TechPopUp/TechSliders/LaptopUsage")
onready var laptopLife = get_node("CanvasLayer/TechPopUp/TechSliders/LaptopLifetime")

# SCHOOL
onready var percentKids = get_node("CanvasLayer/SchoolPopUp/SchoolSliders/PercentKids")
onready var SchoolsqrFtPerStudent = get_node("CanvasLayer/SchoolPopUp/SchoolSliders/SchoolsqrFtPerStudent")
onready var PercentInsulated = get_node("CanvasLayer/SchoolPopUp/SchoolSliders/PercentWellInsulated")
onready var SchoolEnergyUsageForOther = get_node("CanvasLayer/SchoolPopUp/SchoolSliders/SchoolEnergyUsageForOther")

# HOSPITAL
onready var HospsqrFtPerPerson = get_node("CanvasLayer/SchoolPopUp/SchoolSliders/HospsqrFtPerPerson")
onready var HospExtra = get_node("CanvasLayer/SchoolPopUp/SchoolSliders/HospExtra")

onready var CommercialArea = get_node("CanvasLayer/CommercialPopUp/CommercialSliders/CommercialArea")
#onready var CommercialPercent = get_node("CanvasLayer/CommercialPopUp/CommercialSliders/CommercialPercent")
onready var ShippingBoat = get_node("CanvasLayer/CommercialPopUp/CommercialSliders/ShippingBoat")
onready var ShippingTrain = get_node("CanvasLayer/CommercialPopUp/CommercialSliders/ShippingTrain")
onready var ShippingRoad = get_node("CanvasLayer/CommercialPopUp/CommercialSliders/ShippingRoad")

#mobility - Carmen
onready var distAIR = get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityAir")
onready var distBUS = get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityBus")
onready var distRAIL = get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityRail")
onready var distCAR = get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityCar")
#onready var PeoplePerCar = get_node("CanvasLayer/MobilityPopUp/MobilitySliders/Car sharing") 
#onready var CarEff. = get_node("CanvasLayer/MobilityPopUp/MobilitySliders/Car Fuel efficiency")

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
onready var sumVector = [1, 1, 1, 1, 1, 1, 1, 1]
# Calculated quantities mobility - Carmen
var percentAirTravel

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
	insulation.selected = 0
	#battery.min_value = 0 # kW hr
	#battery.max_value = 100 # kW hr
	#var battery0 = 0
	#solarPanelSize.min_value = 0 #  kW
	#solarPanelSize.max_value = 25 # kW
	#var solarPanelSize0 = 0
	
		# RESIDENCE from simon
	FractCooked.min_value = 0 # %
	FractCooked.max_value = 100 # %
	FractCooked.value = 50
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
	ClothesBought.value = 4.0
	ClothesBought.min_value = 0.0
	ClothesBought.max_value = 12.0
#	HotWaterTemp.min_value = 49.0
#	HotWaterTemp.max_value = 65.0
#	HotWaterTemp.value = 55.0
		
	#GROCERY
	localFoodRatio.min_value = 50.0
	localFoodRatio.max_value = 200.0
	localFoodRatio.value = 100.0
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
	processedFoodRatio.max_value = 200.0
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
	SchoolEnergyUsageForOther.min_value = 0
	SchoolEnergyUsageForOther.max_value = 100
	SchoolEnergyUsageForOther.value = 20
	percentKids.min_value = 10.0
	percentKids.max_value = 30.0
	percentKids.value = 20.0
	PercentInsulated.value = 15.0
	PercentInsulated.min_value = 0.0
	PercentInsulated.max_value = 100.0
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
	
	#MEDICAL
	#1.6 m2/cap * 3 for other medical space
	HospsqrFtPerPerson.min_value = 0.0
	HospsqrFtPerPerson.max_value = 20.0
	HospsqrFtPerPerson.value = 5.0
	HospExtra.min_value = 0
	HospExtra.max_value = 45
	HospExtra.value = 15
	
	#MOBILITY - Carmen
	distAIR.min_value = 0.0 #km
	distAIR.max_value = 3000 #km
	distAIR.value = 2197 #km
	distRAIL.min_value = 0.0 #km
	distRAIL.max_value = 1500 #km
	distRAIL.value = 152 #km
	distBUS.min_value = 0.0 #km
	distBUS.max_value = 20000 #km
	distBUS.value = 1089 #km
	distCAR.min_value = 0.0 #km
	distCAR.max_value = 20000 #km
	distCAR.value = 19103 #km
	var totalmobility = 22677 #km
	set_waterheatingcooking()
	set_energyForFoodChoice()
	set_heating()
	set_homeEmbodied()
	set_appliances()
	set_services()
	set_embodied()
	set_mobility()
	
func totalpowercalc(): 
	#crank up 15% for energy infrastructure
	var total = 1.15*(totalPower[0] + totalPower[1] + totalPower[2] + totalPower[3] + totalPower[4] + totalPower[5] + totalPower[6] + totalPower[7])
	get_node("CanvasLayer/UICity/Total").text = str("%3.0f" % total) + " W"

func set_energyForFoodChoice():
	var PTDFract = 150.0 + 20.0*100.0/get_node("CanvasLayer/GroceryPopUp/GrocerySliders/FractLocal").value + 130.0/100.0*get_node("CanvasLayer/GroceryPopUp/GrocerySliders/FractProcessed").value
	energyForFoodChoice = (1.0 + FractWaste.value/100.0) * (100.0 * 0.2 * (1.0 + 23.0*CalorieFractBeef.value/100.0 + 10.0*CalorieFractPoultry.value/100.0 + 5.0*CalorieFractDairy.value/100.0) + 100.0 * 0.23 * (PTDFract)/100.0)
	get_node("CanvasLayer/UICity/FoodLabel").text = "Food:   " + str("%3.0f" % energyForFoodChoice) + " W"
	totalPower[0] = energyForFoodChoice
	totalpowercalc()

#func set_energyForResidence():
#	energyForResidence = (sqrFt.value/pplpRes.value)*6 + (WaterUsage.value * 0.365 * EnergyForWater.value) + (HeatedWater.value * 4.42) + (100 * FractCooked.value * EnergyForCooking.value) + (FridgeEnergyUsage.value / pplpRes.value) + 2 + 0.4 
		# efficient heat pump not used
		# making a fridge + induction cooker
#	get_node("CanvasLayer/UICity/AppliancesLabel").text = "Res: " + str("%3.1f" % energyForResidence) + " Watts"

func set_heating():
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
	if (htClMethod.selected == 3): 
		heating = heating/5.0
	get_node("CanvasLayer/UICity/HeatLabel").text = "Heat: " + str("%3.0f" % heating) + " W"
	totalPower[1] = heating
	totalpowercalc()

func set_homeEmbodied():
	if (bldngMaterial.selected == 0): #timber
		homeEmbodied = sqrFt.value * 30.0*80.0/bldngLifetime.value/pplpRes.value/31.536
	if (bldngMaterial.selected == 1): #concrete
		homeEmbodied = sqrFt.value * 50.0*80.0/bldngLifetime.value/pplpRes.value/31.536
	if (bldngMaterial.selected == 2): #steel
		homeEmbodied = sqrFt.value * 100.0*80.0/bldngLifetime.value/pplpRes.value/31.536
	get_node("CanvasLayer/UICity/HomeLabel").text = "Home: " + str("%3.0f" % homeEmbodied) + " W"
	totalPower[2] = homeEmbodied
	totalpowercalc()
	
func set_illumination():
	var lighttime = 6.0/24.0 #lights on per day
	var lightpercent = 0.33 #percent of residence that's lit
	var brightness = 1.0 #watts per meter squared
	var lightefficiency = 0.2 # for incandescent
	illumination = sqrFt.value/pplpRes.value * lighttime * lightpercent * brightness / lightefficiency
	
func set_waterheatingcooking():
	var calories = (1.0 + FractWaste.value/100.0 )* (100.0) #Calories per day in watts
	if (stove.selected == 0): #wood
		cooking = calories * FractCooked.value/100.0 * 1.5 #approx 10 MJ/kg
	if (stove.selected == 1): #gas
		cooking = calories * FractCooked.value/100.0 * 0.956 #world average
	if (stove.selected == 2): #electric
		cooking = calories * FractCooked.value/100.0 * 0.7 #higher efficiency
	if (stove.selected == 3): #induction/pressure cooker
		cooking = calories * FractCooked.value /100.0* 0.4 #induction
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
	hotwatercook = waterheating + cooking
	get_node("CanvasLayer/UICity/HotWaterCookLabel").text = "Hot H2O: " + str("%3.0f" % hotwatercook) + " W"
	totalPower[3] = hotwatercook
	totalpowercalc()	
	
func set_embodied(): 
	#shared: 8 W for a fridge with 14 year lifetime, 1.6 W for cooking with 20 year lifetime)
	#indiv: 7 W-yr for phone
	# assuming 30 W for new clothes based on current numbers (not best)
	var clothesemb = ClothesBought.value /2.0 * 30.0 
	var embodied = (8.0+ 1.6)/pplpRes.value + 7.0/phoneLife.value + 120.0/laptopLife.value +clothesemb
	get_node("CanvasLayer/UICity/EmbodiedLabel").text = "Embodied: " + str("%3.0f" % embodied) + " W"
	totalPower[4] = embodied
	totalpowercalc()
	
func set_services(): 
	#6 W for waste management, 5 W for cell phone networks, 25 W for laptop network
	#water: 20 L for clothes washing
	#8 L/min shower * 10 min avg = 80 L
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
	schmedEmb = schmedEmb * (1 - 0.9 * PercentInsulated.value/100.0)
	#assumed a 70 year lifetime for schools and 3 times the construction cost
	var school = (schmedEmb* SchoolsqrFtPerStudent.value + SchoolEnergyUsageForOther.value + 3.0 * SchoolsqrFtPerStudent.value * 40.0*80.0/70.0/31.536)*percentKids.value/100.0
	var med = (schmedEmb* HospsqrFtPerPerson.value +HospExtra.value + 9.0 * HospsqrFtPerPerson.value * 40.0*80.0/70.0/31.536)
	var comm = (schmedEmb* 2.0* CommercialArea.value + 3.0 * CommercialArea.value * 40.0*80.0/70.0/31.536)*percentKids.value/100.0
	services = 6.0 + (WaterUsage.value + showerLength.value * 8.0 + 20.0)*0.056*waterfactor + 5.0 + 25.0 + school + med + comm
	get_node("CanvasLayer/UICity/ServicesLabel").text = "Services:   " + str("%3.0f" % services) + " W"
	totalPower[5] = services
	totalpowercalc()
	
func set_mobility(): 
	var mobility = 0
	get_node("CanvasLayer/UICity/MobilityLabel").text = "Mobility: " + str(mobility) + " W"
	totalPower[6] = mobility
	totalpowercalc()
	
func set_appliances(): 
	var appliances = FridgeEnergyUsage.value/pplpRes.value + phoneUse.value*5.0/24.0 + phoneStandby.value*1.0/24.0 + laptopUse.value*100.0/24.0
	get_node("CanvasLayer/UICity/AppliancesLabel").text = "Appliance: " + str("%3.0f" % appliances) + " W"
	totalPower[7] = appliances
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
	get_node("CanvasLayer/GroceryPopUp/GrocerySliders/FractLocal/Label2").text = str("%1.2f" % (localFoodRatio.value/100.0)) + " X"


func _on_FractProcessed_value_changed(value):
	set_energyForFoodChoice()
	get_node("CanvasLayer/GroceryPopUp/GrocerySliders/FractProcessed/Label2").text = str("%1.2f" % (processedFoodRatio.value/100.0)) + " X"
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_SquareFootage_value_changed(value):
	#affects heating, home_embodied, illumination
	set_heating()
	set_illumination()
	set_homeEmbodied()
	get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/SquareFootage/Label").text = str(sqrFt.value) + " sq meters per residence"


func _on_PeoplePerResidence_value_changed(value):
	#affects appliances: refrigerator, stove, embodied energy of home, 
	set_heating() 
	set_illumination()
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
	get_node("CanvasLayer/WaterPopUp/WaterSliders/WaterUsage/Label").text = "Other water usage =         " + str(value) + " L"

func _on_HeatedWater_value_changed(value):
	set_waterheatingcooking()
	get_node("CanvasLayer/WaterPopUp/WaterSliders/HeatedWater/Label").text = "Other heated water =         " + str(value) + " L"

func _on_FractCooked_value_changed(value):
	set_waterheatingcooking()
	get_node("CanvasLayer/CookingPopUp/CookingSliders/FractCooked/Label").text = "Fraction of food that is cooked =         " + str(value) + " %"

func _on_StoveType_item_selected(id):
	set_waterheatingcooking()

func _on_FridgeEnergyUsage_value_changed(value):
	set_appliances()
	get_node("CanvasLayer/CookingPopUp/CookingSliders/FridgeEnergyUsage/Label").text = "Fridge energy usage = " + str(value) + " W"

func _on_ShowerLength_value_changed(value):
	set_waterheatingcooking()
	set_services()
	get_node("CanvasLayer/WaterPopUp/WaterSliders/ShowerLength/Label").text = "Shower length = " + str(value) + " min"

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
	set_embodied()
	get_node("CanvasLayer/TechPopUp/TechSliders/PhoneLifetime/Label").text = "Phone lifetime: " + str(value) + " years"
	if (value == 1): 
		get_node("CanvasLayer/TechPopUp/TechSliders/PhoneLifetime/Label").text = "Phone lifetime: " + str(value) + " year"

func _on_LaptopUsage_value_changed(value):
	set_appliances()
	get_node("CanvasLayer/TechPopUp/TechSliders/LaptopUsage/Label").text = "Laptop/TV usage: " + str(value) + " hrs/day"
	if (value == 1): 
		get_node("CanvasLayer/TechPopUp/TechSliders/LaptopUsage/Label").text = "Laptop/TV usage: " + str(value) + " hr/day"

func _on_LaptopLifetime_value_changed(value):
	set_embodied()
	get_node("CanvasLayer/TechPopUp/TechSliders/LaptopLifetime/Label").text = "Laptop lifetime: " + str(value) + " years"
	if (value == 1): 
		get_node("CanvasLayer/TechPopUp/TechSliders/LaptopLifetime/Label").text = "Laptop lifetime: " + str(value) + " year"

func _on_ToSchool_pressed():
	get_node("CanvasLayer/TechPopUp").visible = false
	get_node("CanvasLayer/SchoolPopUp").visible = true
	get_node("CanvasLayer/SchoolPopUp").rect_position = Vector2(29,160)

func _on_SchoolsqrFtPerStudent_value_changed(value):
	set_services()
	get_node("CanvasLayer/SchoolPopUp/SchoolSliders/SchoolsqrFtPerStudent/Label").text = str(value) + " square meters per student"

func _on_PercentKids_value_changed(value):
	set_services()
	get_node("CanvasLayer/SchoolPopUp/SchoolSliders/PercentKids/Label").text = "Percent of population in school = " + str(value) + "%"

func _on_ToResidence2_pressed():
	get_node("CanvasLayer/SchoolPopUp").visible = false
	get_node("CanvasLayer/CommercialPopUp").visible = true
	get_node("CanvasLayer/CommercialPopUp").rect_position = Vector2(29,160)

func _on_SchoolEnergyUsageForOther_value_changed(value):
	set_services()
	get_node("CanvasLayer/SchoolPopUp/SchoolSliders/SchoolEnergyUsageForOther/Label").text = "Extra energy usage for schools: " + str(value) + " W"

func _on_HospsqrFtPerPerson_value_changed(value):
	set_services()
	get_node("CanvasLayer/SchoolPopUp/SchoolSliders/HospsqrFtPerPerson/Label").text = "Medical floor area: " + str(value) + " square meters per person"

func _on_HospExtra_value_changed(value):
	set_services()
	get_node("CanvasLayer/SchoolPopUp/SchoolSliders/HospExtra/Label").text = "Extra energy usage for medical care: " + str(value) + " W"

func _on_PercentWellInsulated_value_changed(value):
	set_services()
	get_node("CanvasLayer/SchoolPopUp/SchoolSliders/PercentWellInsulated/Label").text = "Well-insulated buildings w/ heat pumps: " + str(value) + "%"


func _on_CommercialArea_value_changed(value):
	set_services()
	get_node("CanvasLayer/CommercialPopUp/CommercialSliders/CommercialArea/Label").text = "Commercial area per person: " + str(value) + " square meters"

func _on_ToMobility_pressed():
	get_node("CanvasLayer/CommercialPopUp").visible = false
	get_node("CanvasLayer/MobilityPopUp").visible = true
	get_node("CanvasLayer/MobilityPopUp").rect_position = Vector2(29,160)
	
	#MOBILITY LABELS - Carmen
func on_MobilityAir_value_changed(value):
	var totalmobility = distAIR.value + distRAIL.value + distBUS.value + distCAR.value
	var percentAirTravel = distAIR.value / totalmobility
	get_node("CanvasLayer/MobilityPopUp/MobilitySliders/MobilityAir/Label2").text = str(percentAirTravel) + "% total distance traveled"
	
	
	
func _on_ToBeginning_pressed():
	get_node("CanvasLayer/MobilityPopUp").visible = false
	get_node("CanvasLayer/ConstructionPopUp").visible = true
	get_node("CanvasLayer/ConstructionPopUp").rect_position = Vector2(29,160)


func _on_ClothesBought_value_changed(value):
	set_embodied()
	get_node("CanvasLayer/WaterPopUp/WaterSliders/ClothesBought/Label").text = "Clothes bought: " + str(value) + " outfits per year"
	pass # Replace with function body.
