extends Node2D


func _on_Button_pressed():
	if get_tree().paused == false:
		get_tree().paused = true
	else:
		get_tree().paused = false
