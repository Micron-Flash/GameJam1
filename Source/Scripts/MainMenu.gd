extends Control



func _on_Play_pressed():
	get_tree().change_scene("res://Source/Story2.tscn")


func _on_Options_pressed():
	get_tree().change_scene("res://Source/Options.tscn")


func _on_Credits_pressed():
	get_tree().change_scene("res://Source/Credits.tscn")
