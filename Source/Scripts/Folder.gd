extends Sprite



# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	self.position = Vector2(-1000,-1000)


func spawn(var pos):
	self.visible = true
	self.position = pos - Vector2(-16,5)

func pickup(var score):
	self.visible = false
	self.position = Vector2(-1000,-1000)
	score += 1
	return score
