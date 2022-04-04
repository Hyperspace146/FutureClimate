extends Node2D


var transition_duration = 2

onready var curtain = $ColorRect
onready var sound = $AudioStreamPlayer
onready var tween = $Tween

func fade_in_sound():
	sound.volume_db = -80
	sound.play()
	tween.interpolate_property(sound, "volume_db", sound.volume_db, -20, transition_duration, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
	tween.interpolate_property(curtain, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), transition_duration, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()

func fade_out_sound():
	tween.interpolate_property(sound, "volume_db", sound.volume_db, -80, transition_duration, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
	tween.interpolate_property(curtain, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), transition_duration, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
	yield(tween, "tween_completed")
	sound.stop()


