extends ColorRect


# Declare member variables here. Examples:
var panels = 0.0
# var b = "text"
func _ready():
	panels = 1.0


# Called when the node enters the scene tree for the first time.
func _process(_delta):
	#var solarpowerperm2 = ((get_node("../../SunSlider").value)*2.0+100.0)*((get_node("../../EfficiencySlider").value)*.0015+.1)
	#panels = 100.0
	#var solargenerated = solarpowerperm2*panels
	#var pop = (get_node("../../PopDensSlider").value*4.0+20.0)
	var elecneeded = (get_node("../../PercapenergySlider").value)/1000.0*7.0
	#print(solargenerated)
	print(elecneeded)
	#var leng = sqrt(solargenerated/elecneeded)
	#print(leng)
	self.rect_size.y = 50.0*elecneeded/7.0
	self.rect_size.x = 500.0*panels/elecneeded
	#get_node("../../RichTextLabel").text = "Clean energy sources deliver " + str(panels) + " tera. \n" + "World demand can be met with " + str(elecneeded) + " tera\nof electricity.\n" + "The energy need is " + str(round(panels/elecneeded*100)) + "% satisfied \nby clean electricity"
	get_node("../../TeraLabel").text = str(panels) + " tera\nof clean \nelectricity\n\n" + str(round(panels/elecneeded*100)) + "% of\ndemand\n(" + str(round(elecneeded)) + " tera)"

func _on_Panel1_toggled(button_pressed):
	if(button_pressed): 
		panels = panels+1.0
	else: 
		panels = panels-1.0

