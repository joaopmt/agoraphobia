extends KinematicBody2D

const UP = Vector2(0, -1)
const MAX_SPEED = 200
const JMP_FORCE = -500
const ACCELERATION = 40
const FRICTION = 0.2
const X_AIR_RESISTANCE = 0.05
const GRAVITY = 20

var speed = Vector2()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	speed.y += GRAVITY
	
	var not_running = false
	
	if Input.is_action_pressed("ui_right"):
		speed.x = min(speed.x+ACCELERATION, MAX_SPEED)
		$animatedSprite.flip_h = false
		$animatedSprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		speed.x = max(speed.x-ACCELERATION, -MAX_SPEED)
		$animatedSprite.flip_h = true
		$animatedSprite.play("run")
	else:
		not_running = true
		$animatedSprite.play("idle")
		
	if is_on_floor():
		if not_running:
			speed.x = lerp(speed.x, 0, FRICTION) # floor contact and not running -> apply friction
		if Input.is_action_pressed("ui_up"):
			speed.y = JMP_FORCE
	else:
		if not_running:
			speed.x = lerp(speed.x, 0, X_AIR_RESISTANCE) # on air -> apply air resistance (x axis)
		if speed.y < 0:
			$animatedSprite.play("jump")
		else:
			$animatedSprite.play("fall")
	
	speed = move_and_slide(speed, UP)

