extends CanvasLayer

export var part = 0
var part2
onready var first = $"1"
onready var first1 =$"1/RichTextLabel"
onready var second = $"2"
onready var second2 =$"2/RichTextLabel"
onready var third = $"3"
onready var second3 =$"3/RichTextLabel"
onready var timer = $Timer
onready var fade = $ColorRect


var done = false

func _ready():
	for i in 100:
			timer.set_wait_time(0.01)
			timer.start()
			yield(timer, "timeout")
			fade.material.set_shader_param("cutoff", i*.01)
	if part == 0:
		first.call_deferred("popup")
		first1.run = true


func _process(delta):
	next(part)
	if Input.is_action_just_pressed("ui_accept"):
		if part == 0:
			first.hide()
			part = 1
		elif part == 1:
			part = 2
			second.hide()
		elif part == 2:
			part = 3
			third.hide()

func next(var par):
	if part == 0:
		first.popup()
		first1.run = true
	elif part == 1:
		second.popup()
		second2.run = true
	elif part == 2:
		third.popup()
		second3.run = true
	elif part == 3:
		for i in get_tree().get_nodes_in_group("Choice"):
			i.visible = true
			i.get_node("StaticBody2D/CollisionShape2D").set_disabled(false)
			
func end():
	for i in 100:
			timer.set_wait_time(0.01)
			timer.start()
			yield(timer, "timeout")
			fade.material.set_shader_param("cutoff", 1-i*.01)
	get_tree().change_scene("res://Source/TBC.tscn")
