extends Control

# CONSTRUCTION
onready var sqrFt = get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/SquareFootage")
onready var pplpRes = get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/PeoplePerResidence")
onready var bldngLifetime = get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/BuildingLifetime")
onready var bldngMaterial = get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/BuildingMaterial")
onready var insulation = get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/Insulation")
onready var htClMethod = get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/HeatCoolMethod")
onready var battery = get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/BatterySize")
onready var solarPanelSize = get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/SolarPanelSize")

# RESIDENCE
onready var stove = get_node("CanvasLayer/ResidencePopUp/ResidenceSliders/StoveType")
onready var cooked = get_node("CanvasLayer/ResidencePopUp/ResidenceSliders/FractCooked")
onready var fridge = get_node("CanvasLayer/ResidencePopUp/ResidenceSliders/FridgeEnergyUsage")
onready var water = get_node("CanvasLayer/ResidencePopUp/ResidenceSliders/WaterUsage")
onready var hotWater = get_node("CanvasLayer/ResidencePopUp/ResidenceSliders/HeatedWater")

# GROCERY
#onready var CalorieFractVege = get_node("CanvasLayer/GroceryPopUp/GrocerySliders/CalorieFractVege")
onready var localFoodRatio = get_node("CanvasLayer/GroceryPopUp/GrocerySliders/FractLocal")
onready var CalorieFractBeef = get_node("CanvasLayer/GroceryPopUp/GrocerySliders/CalorieFractBeef")
onready var CalorieFractPoultry = get_node("CanvasLayer/GroceryPopUp/GrocerySliders/CalorieFractPoultry")
onready var CalorieFractDairy =  get_node("CanvasLayer/GroceryPopUp/GrocerySliders/CalorieFractDairy")
onready var FractWaste = get_node("CanvasLayer/GroceryPopUp/GrocerySliders/FractWaste")
#onready var PTD = get_node("CanvasLayer/GroceryPopUp/GrocerySliders/FractProcessed") # Sum of Processing, Transporting and Distribution
onready var processedFoodRatio = get_node("CanvasLayer/GroceryPopUp/GrocerySliders/FractProcessed")

#Calculated quantities
var heating = 0
var illumination = 0
var homeEmbodied = 0
var energyForFoodChoice = 0


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
	bldngMaterial.min_value = 1
	bldngMaterial.max_value = 3 # 1 = timber, 2 = concrete, 3 = steel
	bldngMaterial.value = 2
	var bldngMaterial0 = 2
	insulation.min_value = 10 # kW hr / m^2 / year
	insulation.max_value = 200 # kW hr / m^2 / year
	insulation.value = 100
	var insulation0 = 100
	htClMethod.min_value = 1 
	htClMethod.max_value = 4 # 1 = heat pump, 2 = electrical resistance, 3 = gas, 4 = wood
	var htClMethod0 = 3
	battery.min_value = 0 # kW hr
	battery.max_value = 100 # kW hr
	var battery0 = 0
	solarPanelSize.min_value = 0 #  kW
	solarPanelSize.max_value = 25 # kW
	var solarPanelSize0 = 0
	
	# RESIDENCE
	stove.min_value = 1
	stove.min_value = 4 # 1 = induction, 2 = electrical resistance, 3 = gas, 4 = wood
	cooked.min_value = 0 # %
	cooked.max_value = 100 # %
	fridge.min_value = 14 # Watts
	fridge.max_value = 200 # Watts
	water.min_value = 50 # liters / day
	water.max_value = 500 # liters / day
	hotWater.min_value = 20 # liters / day
	hotWater.max_value = 200 # liters / day
		
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
	
func set_energyForFoodChoice():
	var PTDFract = 150.0 + 20.0*100.0/get_node("CanvasLayer/GroceryPopUp/GrocerySliders/FractLocal").value + 130.0/100.0*get_node("CanvasLayer/GroceryPopUp/GrocerySliders/FractProcessed").value
	print(PTDFract)
	energyForFoodChoice = (1.0 + FractWaste.value/100.0) * (100.0 * 0.2 * (1.0 + 23.0*CalorieFractBeef.value/100.0 + 10.0*CalorieFractPoultry.value/100.0 + 5.0*CalorieFractDairy.value/100.0) + 100.0 * 0.23 * (PTDFract)/100.0)
	get_node("CanvasLayer/UICity/Label3").text = "Food: " + str("%3.1f" % energyForFoodChoice) + " W"

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
	get_node("CanvasLayer/GroceryPopUp/GrocerySliders/FractLocal/Label2").text = str("%3.1f" % localFoodRatio.value) + "% of today's"


func _on_FractProcessed_value_changed(value):
	set_energyForFoodChoice()
	get_node("CanvasLayer/GroceryPopUp/GrocerySliders/FractProcessed/Label2").text = str("%3.1f" % processedFoodRatio.value) + "% of today's"
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_heating():
	heating = sqrFt.value * insulation.value/pplpRes.value/8.76 #kilo-hours per year
	if (htClMethod.value == 4): 
		heating = heating/5.0
	get_node("CanvasLayer/UICity/Label2").text = "Heat: " + str("%3.1f" % heating) + " W"

func set_homeEmbodied():
	if (bldngMaterial.value == 1): #timber
		homeEmbodied = sqrFt.value * 30.0*80.0/bldngLifetime.value/pplpRes.value/31.536
	if (bldngMaterial.value == 2): #concrete
		homeEmbodied = sqrFt.value * 50.0*80.0/bldngLifetime.value/pplpRes.value/31.536
	if (bldngMaterial.value == 3): #steel
		homeEmbodied = sqrFt.value * 100.0*80.0/bldngLifetime.value/pplpRes.value/31.536
	get_node("CanvasLayer/UICity/Label1").text = "Home: " + str("%3.1f" % homeEmbodied) + " W"
	
	
func set_illumination():
	illumination = sqrFt.value/pplpRes.value #* time * percent * watts
	
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
	get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/PeoplePerResidence/Label").text = str(pplpRes.value) + " people per residence"



func _on_BuildingLifetime_value_changed(value):
	#affect embodied energy of home
	set_homeEmbodied()
	get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/BuildingLifetime/Label").text = str(bldngLifetime.value) + " yr lifetime of building"


func _on_BuildingMaterial_value_changed(value):
	#affects embodied energy of home
	if (bldngMaterial.value == 1): #timber
		set_homeEmbodied()
		get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/BuildingMaterial/Label").text = "Best timber building"
	if (bldngMaterial.value == 2): #concrete
		set_homeEmbodied()
		get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/BuildingMaterial/Label").text = "Best concrete building"
	if (bldngMaterial.value == 3): #steel
		set_homeEmbodied()
		get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/BuildingMaterial/Label").text = "Best steel building"


func _on_Insolation_value_changed(value):
	#affects climate
	set_heating() #kilo-hours per year
	get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/Insulation/Label").text = str(value) + " kWh/m2/yr for heat/cool"



func _on_HeatCoolMethod_value_changed(value):
	if (htClMethod.value == 1): 
		set_heating()
		get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/HeatCoolMethod/Label").text = "Gas heat"
	if (htClMethod.value == 2): 
		set_heating()
		get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/HeatCoolMethod/Label").text = "Electrical resistance heat"
	if (htClMethod.value == 3): 
		set_heating()
		get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/HeatCoolMethod/Label").text = "Wood heat"
	if (htClMethod.value == 4): 
		set_heating()
		get_node("CanvasLayer/ConstructionPopUp/ConstructionSliders/HeatCoolMethod/Label").text = "Heat pump"
	#affects climate
	pass # Replace with function body.


func _on_Battery_value_changed(value):
	pass # Replace with function body.


func _on_ToGrocery_pressed():
	get_node("CanvasLayer/ConstructionPopUp").visible = false
	get_node("CanvasLayer/GroceryPopUp").visible = true
	get_node("CanvasLayer/GroceryPopUp").rect_position = Vector2(29,180)



func _on_ToResidence_pressed():
	get_node("CanvasLayer/GroceryPopUp").visible = false
	get_node("CanvasLayer/ResidencePopUp").visible = true
	get_node("CanvasLayer/ResidencePopUp").rect_position = Vector2(29,180)
	pass # Replace with function body.
