extends Node2D

var dialog_and_query_box_load = preload("res://scenes/DialogAndQueryBox.tscn")

var dialog_and_query_box

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _on_AreaDialog_body_entered(body):
	dialog_and_query_box = dialog_and_query_box_load.instance()
	var dialog = dialog_and_query_box.get_children()[0]
	dialog.filepath = "res://dialogs/6-cara_normal.txt"
	self.add_child(dialog_and_query_box)
	self.remove_child($AreaDialog)