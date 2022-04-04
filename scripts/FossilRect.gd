extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var badtera = 6.0

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.FFPower = 6.0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	#var solarpowerperm2 = ((get_node("../../SunSlider").value)*2.0+100.0)*((get_node("../../EfficiencySlider").value)*.0015+.1)
	#panels = 100.0
	#var solargenerated = solarpowerperm2*panels*100.0
	#var pop = (get_node("../../PopDensSlider").value*4.0+20.0)
	#var elecneeded = (get_node("../../UsageSlider").value*20.0+500.0)*pop
	#print(solargenerated)
	#print(elecneeded)
	#var leng = tera/7.0
	#print(leng)
	#self.rect_size.y = 500.0*leng
	var elecneeded = (get_node("../../PercapenergySlider").value)/1000.0*7.0
	#print(solargenerated)
	#print(elecneeded)

	#var leng = sqrt(solargenerated/elecneeded)
	#print(leng)
	self.rect_size.x = 50.0*elecneeded/7.0
	self.rect_size.y = 500.0*GlobalVariables.FFPower/elecneeded #  Rikki new line
	#self.rect_size.y = 500.0*badtera/elecneeded                #  Dargan origin line
	#if(badtera): 
		#get_node("../../RichTextLabel3").text = "An additional " + str(round(badtera/elecneeded*100)) + "% of energy demand \nis satisfied by combustion. \nStill need to shut down the equivalent of \n" + str(badtera) + " tera worth of dirty energy."
	#else: 
		#get_node("../../RichTextLabel3").text = "An additional " + str(round(badtera/elecneeded*100)) + "% of energy demand \nis satisfied by combustion."
#	pass


func _on_Fossil91_toggled(button_pressed):
	if(button_pressed): 
		GlobalVariables.FFPower += 1.0
	else: 
		GlobalVariables.FFPower -= 1.0
#	if(button_pressed): 
#		badtera = badtera+1.0
#	else: 
#		badtera = badtera-1.0
 

