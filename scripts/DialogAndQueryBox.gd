extends Polygon2D

var query_box= preload("res://scenes/PlayerQueryBox.tscn")

var query_box_instance

onready var dialog = get_node("Dialog")

func _on_Dialog_done():
	print("done")
	get_parent().remove_child(self)


func _on_Dialog_player_query_signal():
	pass
	query_box_instance = query_box.instance()
	self.add_child(query_box_instance)
	query_box_instance.connect("yes", self, "on_yes_button_down")
	query_box_instance.connect("no", self, "on_no_button_down")

func on_yes_button_down():
	self.remove_child(query_box_instance)
	dialog.yes_was_pressed = true
	dialog.set_process(true)
	dialog.next_dialog = true


func on_no_button_down():
	self.remove_child(query_box_instance)
	dialog.no_was_pressed = true
	dialog.set_process(true)
	dialog.next_dialog = true
