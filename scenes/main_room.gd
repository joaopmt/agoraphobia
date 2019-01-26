extends Node2D

signal changed

func _on_Door_body_entered(body):
	emit_signal("changed")
