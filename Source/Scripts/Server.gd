extends AnimatedSprite


export var health = 50
onready var health_Bar = $HealthBar
onready var sound = $AudioStreamPlayer2D
onready var sound2 = $AudioStreamPlayer
onready var fire = $CPUParticles2D
onready var firecol = $StaticBody2D2/CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	fire.visible = false
	firecol.disabled = true
	health_Bar.set_health(health)

func hit(var dmg):
	health -= dmg
	health_Bar.update_health(health)
	sound.play()
	if health <=0:
		death()
		
		
func death():
	fire.visible = true
	firecol.disabled = false
	sound2.play()
	
