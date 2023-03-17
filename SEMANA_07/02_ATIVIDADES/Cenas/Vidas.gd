extends Node2D

func _process(delta):
	var hearts = Global.lifes
	
	if hearts == 4: 
		$coracao5.hide()
	if hearts == 3:
		$coracao4.hide()
		$coracao5.hide()
	if hearts == 2:
		$coracao3.hide()
		$coracao4.hide()
		$coracao5.hide()
	if hearts == 1:
		$coracao2.hide()
		$coracao3.hide()
		$coracao4.hide()
		$coracao5.hide()
	if hearts == 0:
		$coracao1.hide()
		$coracao2.hide()
		$coracao3.hide()
		$coracao4.hide()
		$coracao5.hide()
