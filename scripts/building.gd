#extends Node2D
#
#signal changed
#signal up
#signal down
#
#var in_area1 = false
#var in_area2 = false
#var in_area3 = false
#var in_area4 = false
#var in_area5 = false
#
#func _ready():
#	set_process(true)
#
#func _process(delta):
#	if in_area1:
#		if Input.is_action_pressed("ui_up"):
#			emit_signal("up")
#			$Elevators/Elevator1.set_process(false)
#
#
#
#func _on_Door_body_entered(body):
#	emit_signal("changed")
#
#
#func _on_Elevator1_body_entered(body):
#	in_area = true
#
#
#func _on_Elevator1_body_exited(body):
#	in_area = false
#
