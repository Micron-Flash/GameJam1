extends Label

export(NodePath) var door_path
onready var door = get_node(door_path)
export var MaxScore = 6
export(NodePath) var fade_path
onready var fade = get_node(fade_path)
onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)



func _process(delta):
	self.set_text(str(door.folderScore) + "/" + str(MaxScore))
	if door.folderScore == MaxScore:
		for i in 100:
			timer.set_wait_time(0.01)
			timer.start()
			yield(timer, "timeout")
			fade.material.set_shader_param("cutoff", i*.01)
		get_tree().change_scene("res://Source/End.tscn")
