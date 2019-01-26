extends KinematicBody2D

const MAX_SPEED = 200
const ACCELERATION = 40
const FRICTION = 0.2
const X_AIR_RESISTANCE = 0.05

var speed = Vector2()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	
	var not_running = false
	
	if Input.is_action_pressed("ui_right"):
		speed.x = min(speed.x+ACCELERATION, MAX_SPEED)
#		$animatedSprite.flip_h = false
#		$animatedSprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		speed.x = max(speed.x-ACCELERATION, -MAX_SPEED)
#		$animatedSprite.flip_h = true
#		$animatedSprite.play("run")
	else:
		not_running = true
#		$animatedSprite.play("idle")
	
	if not_running:
		speed.x = lerp(speed.x, 0, FRICTION) # floor contact and not running -> apply friction
	
	speed = move_and_slide(speed)

