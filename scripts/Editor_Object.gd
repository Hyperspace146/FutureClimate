extends Node2D

var can_place = true
var is_panning = false;
#onready var level = get_node("/root/MainMap/Level")

var editor = self
onready var editor_cam = editor.get_node("Camera2D")

export var cam_spd = 4
var current_item

func _ready():
	
	if "MainMap" in get_parent().name:
		editor_cam.current = true
		editor_cam.limit_top = 0
		editor_cam.limit_left = -300
		editor_cam.limit_bottom = 1700
		editor_cam.limit_right = 2500
		editor_cam.zoom = Vector2(1, 1)
	elif "OutdoorView" in get_parent().name:
		editor_cam.limit_top = -1050
		editor_cam.limit_left = -1200
		editor_cam.limit_bottom = 1950
		editor_cam.limit_right = 1400
		editor_cam.zoom = Vector2(2, 2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	move_editor()
	#is_panning = Input.is_action_pressed("mb_middle")

	
func move_editor():
	if Input.is_action_pressed("ui_up"):
		if editor.global_position.y > editor_cam.limit_top + 140:
			print("ui up pressed")
			editor.global_position.y -= cam_spd
	if Input.is_action_pressed("ui_left"):
		if editor.global_position.x > editor_cam.limit_left :#+ 250:
			print("ui left pressed", editor.global_position.x, ", ", editor_cam.limit_left)
			editor.global_position.x -= cam_spd
	if Input.is_action_pressed("ui_down"):
		if editor.global_position.y < editor_cam.limit_bottom - 140:
			print("ui down pressed")
			editor.global_position.y += cam_spd
	if Input.is_action_pressed("ui_right"):
		if editor.global_position.x < editor_cam.limit_right - 250:
			print("ui right pressed")
			editor.global_position.x += cam_spd


func _unhandled_input(event):
	if(event is InputEventMouseButton):
		if(event.is_pressed()):
			if(event.button_index == BUTTON_WHEEL_UP):
				if editor_cam.zoom >= Vector2(0.1, 0.1):
					editor_cam.zoom -= Vector2(0.1,0.1)
			if(event.button_index == BUTTON_WHEEL_DOWN):
				if editor_cam.zoom <= Vector2(1.6, 1.6):
					editor_cam.zoom += Vector2(0.1,0.1)
	if(event is InputEventMouseMotion):
		if(is_panning):
			editor.global_position -= event.relative * editor_cam.zoom

