extends Area2D

func _ready(): # function to show the E flag and play E popping animation
	$flag.show()
	$AnimationPlayer.play("popping_e")

func _input(event): # function so that when all coins are collected the door is "openable"
	if event.is_action_pressed("ui_accept"):
		if Global.can_enter == true:
			if get_overlapping_bodies().size() > 1:
				_next_level()
			

func _next_level(): # function to change levels
	var ERR = get_tree().change_scene("res://Cenas/Resume.tscn")




