extends Node2D

var dialog_and_query_box_load = preload("res://scenes/DialogAndQueryBox.tscn")

var dialog_and_query_box


func _ready():
	pass
	

func _process(delta):
	pass


func _on_AreaDialog_body_entered(body): # oneshot
	dialog_and_query_box = dialog_and_query_box_load.instance()
	var dialog = dialog_and_query_box.get_children()[0]
	dialog.filepath = "res://dialogs/teste"
	self.add_child(dialog_and_query_box)