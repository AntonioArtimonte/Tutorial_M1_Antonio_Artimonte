extends Node2D


func _ready(): # function to play coin animation
	$SpriteCoin/AnimationPlayer.play("coin")


func _on_CoinArea_body_entered(body): # function so that when character is inside coin area, the coin is collected
	if body.has_method("_get_coin"):
		$Timer.start()
		$SpriteCoin/AnimationPlayer.play("coincollected")
		body._get_coin()


func _on_Timer_timeout(): # function so that when timer == 0 the coin vanishes
	queue_free()
