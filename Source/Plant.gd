extends AnimatedSprite

export(NodePath) var folder_path
export var objective = false
onready var parts = $CPUParticles2D
var home
var done = false

func _ready():
	parts.visible = false
	if objective == true:
		parts.visible = true
		#self.modulate = Color(1,0.93,0.55)
		
	if folder_path:
		home = get_node(folder_path)
	self.frame = 0

func dead():
	if home:
		if done == false:
			done = true
			parts.visible = false
			home.spawn(self.get_global_position())
	self.frame = 1
