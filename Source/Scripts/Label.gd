extends Label

var time = 0
var paused = false


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)



func _process(delta):
	if not paused:
		time += delta
	text = String(stepify(time,0.1))
