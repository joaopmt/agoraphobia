extends Polygon2D

signal yes
signal no


func _on_YesButton_button_down():
	emit_signal("yes")

func _on_NoButton_button_down():
	emit_signal("no")
