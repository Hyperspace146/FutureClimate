extends TextureButton

onready var anim = get_node("AnimatedSprite")
onready var sprite = get_node("Sprite")

var can_grab = false
var grabbed_offset = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	if "FF" in get_name():
		anim.play("on")
		sprite.hide()
		modulate = Color8(255,255,255)
	else:
		anim.stop()
		sprite.show()
		anim.frame = 2
		modulate = Color8(120,120,120)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_TextureButton_gui_input(event):
	
	#if (event is InputEventMouseButton && event.pressed):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_RIGHT:
		can_grab = event.pressed
		print("Clicked")
	#if event is InputEventMouseButton and event.is_released() and event.button_index == BUTTON_RIGHT:
	elif event is InputEventMouseButton and event.pressed == false and event.button_index == BUTTON_RIGHT:
		can_grab = false


func _process( _delta ):
	if Input.is_mouse_button_pressed(BUTTON_RIGHT) and can_grab:
		var mousepos = get_global_mouse_position() - Vector2(20,15)
		self.set_global_position(Vector2( mousepos.x, mousepos.y ) )


func _on_TextureButton_toggled(button_pressed):
	print(button_pressed)
	if button_pressed == true:
		anim.play("on")
		sprite.hide()
		modulate = Color8(255,255,255)
		if "Wind" in get_name():
			GlobalVariables.windPower += 2
		elif "Solar" in get_name():
			GlobalVariables.solarPower += 1
		elif "Nuclear" in get_name():
			GlobalVariables.nuclearPower += 3
		elif "FF" in get_name():
			print("turning on ff")
			GlobalVariables.FFPower += 35
	else:
		anim.stop()
		anim.frame = 2
		sprite.show()
		modulate = Color8(120,120,120)
		if "Wind" in get_name():
			GlobalVariables.windPower -= 2
		elif "Solar" in get_name():
			GlobalVariables.solarPower -= 1
		elif "Nuclear" in get_name():
			GlobalVariables.nuclearPower -= 3
		elif "FF" in get_name():
			GlobalVariables.FFPower -= 35
	get_node("../../CanvasLayer/UILocal")._on_Slider_changed()
	
