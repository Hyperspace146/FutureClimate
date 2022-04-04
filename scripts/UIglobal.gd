extends Control


onready var playbutton = get_node("blank/Play")
onready var pausebutton = get_node("blank/Pause")

onready var anim = get_node("VBoxContainer/AnimationPlayer")
onready var YEAR = get_node("TextureRect/Year")
onready var TEMP = get_node("VBoxContainer/GlobTemp/Temp")

func _ready():
	playbutton.hide()
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	YEAR.text = str(int(GlobalVariables.GlobalYear))
	TEMP.text = str(GlobalVariables.GlobalTemp)


func _on_AreaTemp_mouse_entered():
	#if !anim.is_playing():
	anim.play("GlobTemp")
func _on_AreaTemp_mouse_exited():
	anim.play_backwards("GlobTemp")


func _on_AreaSeaLev_mouse_entered():
	anim.play("GlobSeaLev")
func _on_AreaSeaLev_mouse_exited():
	anim.play_backwards("GlobSeaLev")


func _on_AreaEmit_mouse_entered():
	anim.play("GlobEmit")
func _on_AreaEmit_mouse_exited():
	anim.play_backwards("GlobEmit")


func _on_Play_pressed():
	playbutton.hide()
	pausebutton.show()
	get_tree().paused = true


func _on_Pause_pressed():
	pausebutton.hide()
	playbutton.show()
	get_tree().paused = false



func _on_SettingsButton_toggled(button_pressed):
	if button_pressed == true:
		$AnimationPlayer.play("Settings")
	else:
		$AnimationPlayer.play_backwards("Settings")
