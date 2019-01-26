extends Polygon2D

func _on_Dialog_done():
	get_parent().remove_child(self)
