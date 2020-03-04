extends Control



func _on_Retry_pressed():
	get_tree().change_scene("res://Source/Game.tscn")


func _on_Menu_pressed():
	get_tree().change_scene("res://Source/MainMenu.tscn")
