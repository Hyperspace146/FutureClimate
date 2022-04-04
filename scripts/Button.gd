extends TextureButton





# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().reload_current_scene()

func _on_GraphButton_pressed():
	get_node("../PopupGraph").popup_centered_minsize()

func _on_GraphButton2_pressed():
	get_node("../PopupGraph2").popup_centered_minsize()

func _on_BackButton_pressed():
	get_tree().change_scene("res://scenes/MainScene.tscn")






