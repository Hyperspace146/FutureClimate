extends Label


export var turn_label_text = "Turn: "

onready var turn_num = 0


func end_turn():
	turn_num += 1
	_update_turn_label()

func _ready():
	_update_turn_label()

func _update_turn_label():
	text = turn_label_text + str(turn_num)
