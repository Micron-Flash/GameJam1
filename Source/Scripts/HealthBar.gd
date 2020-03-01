extends Control

onready var health =  $TextureProgress



func set_health( var Max_health):
	health.max_value = Max_health
	health.value = Max_health
	
func update_health(var new_health):
	health.value = new_health


