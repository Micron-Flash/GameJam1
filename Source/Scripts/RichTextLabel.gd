extends RichTextLabel

var lapsed = 0
var charNum = 0
export var run = false
func _ready():
	#set_fixed_process(true)
	lapsed = 0
	set_visible_characters(0) # <<<< Added this

func _physics_process(delta):
	if run == true:
		lapsed = lapsed + delta
		charNum = set_visible_characters(lapsed / .03)
