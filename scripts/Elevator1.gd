extends Area2D

signal changed
signal up
signal down

var in_area = false

func _ready():
	set_process(true)

func _process(delta):
	if in_area:
		if Input.is_action_pressed("ui_up"):
			emit_signal("up")
			self.set_process(false)


func _on_Door_body_entered(body):
	emit_signal("changed")


func _on_Elevator1_body_entered(body):
	in_area = true


func _on_Elevator1_body_exited(body):
	in_area = false

