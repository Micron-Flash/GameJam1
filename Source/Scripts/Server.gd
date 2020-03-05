extends AnimatedSprite

export(NodePath) var folder_path
var home
var done = false
export var health = 50
onready var health_Bar = $HealthBar
onready var sound = $AudioStreamPlayer2D
onready var sound2 = $AudioStreamPlayer
onready var fire = $CPUParticles2D
onready var firecol = $StaticBody2D2/CollisionShape2D
export var objective = false
onready var parts = $CPUParticles2D2

# Called when the node enters the scene tree for the first time.
func _ready():
	parts.visible = false
	if objective == true:
		parts.visible = true
		#self.modulate = Color(1,0.93,0.55)
	if folder_path:
		home = get_node(folder_path)
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
	if home:
		if done == false:
			done = true
			parts.visible = false
			home.spawn((self.get_global_position() + Vector2(-32,-50)))
	sound2.play()
	
