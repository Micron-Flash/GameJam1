extends KinematicBody2D

export var cutscene = false
const UP = Vector2(0,-1)
const GRAVITY = 20
const MAX_SPEED = 250
const ACCELERATION = 25
const JUMP_HEIGHT = -550
var motion = Vector2()
var byLock = false
export var dmg = 10
export var health = 100
var byLaser = false 
var byThing = false
var byServer = false
export var folderScore = 0
var byFire = false
var alive = true
var onFire = false
var byFolder = false
var end = false
onready var timer = $Timer
onready var camera = $Camera2D 
onready var health_Bar = $HealthBar
onready var animate = $AnimationTree.get("parameters/playback")
onready var collider = $Area2D
var bod
onready var sound = $AudioStreamPlayer2D
onready var sound2 = $AudioStreamPlayer2D2
onready var player = $AnimatedSprite

func _ready():
	health_Bar.set_health(health)



func _physics_process(_delta):
	self.modulate = Color(1,1,1)
	motion.y += GRAVITY
	var friction = false
	if alive:
		if Input.is_action_pressed("ui_right"):
			motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
			animate.travel("Walk")
			player.set_flip_h(false)
			collider.set_scale(Vector2(1,1))
		elif Input.is_action_pressed("ui_left"):
			motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
			animate.travel("Walk")
			player.set_flip_h(true)
			collider.set_scale(Vector2(-1,1))
			
		else:
			animate.travel("Idle")
			friction = true
		
		if is_on_floor():
			if Input.is_action_just_pressed("ui_up"):
				motion.y = JUMP_HEIGHT
				sound2.play()
			if friction == true:
				motion.x = lerp(motion.x, 0 , 0.3 )
		else:
			animate.travel("Jump")
			if friction == true:
				motion.x = lerp(motion.x, 0 , 0.05 )
		
		motion = move_and_slide(motion, UP)
		
		if Input.is_action_just_pressed("Action"):
			if !cutscene:
				animate.travel("Attack")
				sound.play()
				if byLock:
					camera.shake(.2,15,8)
					bod.hit(dmg)
				if byLaser:
					camera.shake(.2,15,8)
					bod.get_parent().hit(dmg)
				if byServer:
					camera.shake(.2,15,8)
					bod.get_parent().hit(dmg)
				if byServer:
					camera.shake(.2,15,8)
					bod.get_parent().hit(dmg)
				if byThing:
					camera.shake(.2,15,8)
					bod.get_parent().dead()
		if onFire:
			damage(1)


func _on_Area2D_body_entered(body):
	bod = body
	if body.is_in_group("Lock"):
		byLock = true
	elif body.is_in_group("Laser"):
		byLaser = true
	elif body.is_in_group("Server"):
		byServer = true
	elif body.is_in_group("Stuff"):
		byThing = true
	if body.is_in_group("Folder"):
		self.folderScore = body.get_parent().pickup(self.folderScore)
	if body.is_in_group("cho"):
		body.get_tree().get_root().get_node("End/CanvasLayer").end()

	


func _on_Area2D_body_exited(body):
	bod = null
	byLock = false
	byLaser = false
	byServer = false
	byThing = false
	byFolder = false
	
	
func damage(var hit):
	self.modulate = Color(1,0,0)
	health -= hit
	health_Bar.update_health(health)
	if health <= 0:
		dead()

func dead():
	rotation_degrees = 90
	alive = false
	get_tree().change_scene("res://Source/Death.tscn")
	
	
	
	
func _on_Area2D2_body_entered(body):
	if body.is_in_group("Fire"):
		onFire = true

func _on_Area2D2_body_exited(body):
	onFire = false
