extends Node2D


func _ready(): # function to play NPC and popping E animations
	$AnimationPlayerNPC.play("NPC_idle")
	$AreaNPC/AnimationPlayerE.play("popping_e")




func _on_AreaNPC_body_entered(body): # function to make when anything enters npc body can show dialog
	Global.is_on = true
	print(Global.is_on)
