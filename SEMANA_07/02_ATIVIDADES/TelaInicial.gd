extends Node2D





func _on_BotaoSair_pressed(): # quit button
	get_tree().quit()


func _on_ButaoJogar_pressed():
	get_tree().change_scene("res://Cenas/Fase1.tscn")
