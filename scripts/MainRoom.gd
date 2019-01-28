extends Node2D

var dialog_and_query_box_load = preload("res://scenes/DialogAndQueryBox.tscn")

var dialog_and_query_box

func _on_Door_body_entered(body):
	emit_signal("changed")


func _on_DialogArea_area_entered(area):
	dialog_and_query_box = dialog_and_query_box_load.instance()
	var dialog = dialog_and_query_box.get_children()[0]
	self.add_child(dialog_and_query_box)
	dialog.filepath = "res://dialogs/1-introducao.txt"
#	self.remove_child($AreaDialog)