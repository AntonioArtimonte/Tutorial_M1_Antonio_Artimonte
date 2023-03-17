extends Node2D

func _process(delta): # function to get out of GameOver screen
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://Cenas/Fase1.tscn")
		Global.lifes = 5
