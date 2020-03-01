extends Sprite

var move = Vector2()

func _ready():
	move = Vector2(rand_range(.05,.25),rand_range(-.15,.15))


func _physics_process(delta):
	position += move
