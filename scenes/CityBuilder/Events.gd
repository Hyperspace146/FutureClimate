extends Node2D

signal end_turn()


func _emit_signal_end_turn():
	emit_signal("end_turn")
