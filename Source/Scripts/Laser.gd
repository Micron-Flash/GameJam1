extends Node2D


onready var start = $Position2D
export(NodePath) var laser_path
onready var laser = get_node(laser_path)
export var speed = 1
export var health = 15
export var turn = true
onready var las = $"."
onready var health_Bar = $HealthBar
var startdir
var laz = true


func _ready():
	las.set_frame(0)
	startdir = (start.global_position + transform.x * 1000)
	laz = laser.startlaser(start.global_position, startdir)
	health_Bar.set_health(health)




func _process(_delta):
	if laz == false:
		startdir = (start.global_position + transform.x * 1000)
		laz = laser.startlaser(start.global_position, startdir)
	if turn:
		rotation_degrees += speed
	if health <= 0:
		death()
	
	
func hit(var dmg):
	health -= dmg
	health_Bar.update_health(health)

func death():
	if laz == false:
		laser.queue_free()
		laz = true
		las.set_frame(1)
