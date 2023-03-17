extends Node2D




func _on_AreaSpikes_body_entered(body): # function so that when character falls on spike they lose their coins and a life
	Global.lifes -= 1
	Global.coins = 0
	get_tree().reload_current_scene()

func _process(delta): # function that when has 3 coins, the door can be openable and changes coin counter
	if Global.lifes == 0:
		get_tree().change_scene("res://Cenas/GameOver.tscn")
	get_node("FundoFase/CoinCounter/AmountCoins").text = str(Global.coins, " / 3")
	if Global.coins == 3:
		Global.can_enter = true


