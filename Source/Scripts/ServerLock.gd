extends AnimatedSprite


export var health = 50
onready var health_Bar = $HealthBar
export(NodePath) var door_path
onready var door = get_node(door_path)
onready var sound = $AudioStreamPlayer2D
onready var sound2 = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	health_Bar.set_health(health)

func hit(var dmg):
	if health > 0:
		health -= dmg
		health_Bar.update_health(health)
		sound.play()
		if health <=0:
			death()
		
		
func death():
	var inst = preload("res://Source/Sprite.tscn")
	var fire = inst.instance()
	fire.position = Vector2(0,-10)
	add_child(fire)
	sound2.play()
	door.queue_free()
	
