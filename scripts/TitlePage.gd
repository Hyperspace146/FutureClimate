extends Node2D

signal done
var _dest
var destination


func _ready():
	$Music.fade_in_sound()

func _enter_tree():
	print("Main Menu enter tree")
	var donesignal = self
	donesignal.connect("done",self,"handle_done")



func handle_done():
	_dest = get_tree().change_scene(destination)


func _on_ByGHGButton_pressed():
	$Music.fade_out_sound()
	$Timer.start()
	destination = str("res://scenes/GHGMode.tscn")


func _on_BySectorButton_pressed():
	$Music.fade_out_sound()
	$Timer.start()
	destination = str("res://scenes/SectorMode.tscn")


func _on_OneBarButton_pressed():
	$Music.fade_out_sound()
	$Timer.start()
	destination = str("res://scenes/OneBarMode.tscn")


func _on_PlayGame_pressed():
	$Music.fade_out_sound()
	$Timer.start()
	destination = str("res://scenes/MainMap.tscn")


func _on_Timer_timeout():
	emit_signal("done")
