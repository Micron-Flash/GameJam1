extends CanvasLayer


onready var fade = $ColorRect
onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 100:
			timer.set_wait_time(0.01)
			timer.start()
			yield(timer, "timeout")
			$ColorRect.material.set_shader_param("cutoff", i*.01)

