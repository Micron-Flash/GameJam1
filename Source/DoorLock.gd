extends StaticBody2D

export(NodePath) var door_path
onready var door = get_node(door_path)
export(NodePath) var folder_path
var home
export var health = 20
onready var sparks = $AnimatedSprite/MainParticle
onready var health_Bar = $HealthBar
onready var sound = $AudioStreamPlayer2D
onready var sound2 = $AudioStreamPlayer

func _ready():
	if folder_path:
		home = get_node(folder_path)
	$AnimatedSprite.set_animation("Lock")
	sparks.visible = false
	health_Bar.set_health(health)

func hit(var damage):
	if health > 0:
		health -= damage
		if health > 0:
			sound.play()
		health_Bar.update_health(health)
		if health <= 0 :
			dead()
		

func dead():
	$AnimatedSprite.set_animation("Open")
	sparks.visible = true
	if home:
		home.spawn(self.position)
	sound2.play()
	door.queue_free()
