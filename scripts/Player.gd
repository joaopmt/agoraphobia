extends KinematicBody2D

var MAX_SPEED = 320
const ACCELERATION = 40
const FRICTION = 0.2
const X_AIR_RESISTANCE = 0.05
const GRAVITY = 10
const MAX_GRAVITY = 500

var speed = Vector2()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	
	speed.y = min(speed.y+GRAVITY, MAX_GRAVITY)
	
	var not_running = false
	
	if Input.is_action_pressed("ui_right"):
		speed.x = min(speed.x+ACCELERATION, MAX_SPEED)
		$Anim.flip_h = false
		$Anim.play("walk")
	elif Input.is_action_pressed("ui_left"):
		speed.x = max(speed.x-ACCELERATION, -MAX_SPEED)
		$Anim.flip_h = true
		$Anim.play("walk")
	else:
		not_running = true
		$Anim.play("idle")
	
	if not_running:
		speed.x = lerp(speed.x, 0, FRICTION) # floor contact and not running -> apply friction
	
	speed = move_and_slide(speed)

