extends Control


onready var story = $PopupDialog


# Called when the node enters the scene tree for the first time.
func _ready():
	story.popup()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
