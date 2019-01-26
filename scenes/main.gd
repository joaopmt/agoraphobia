extends Node

var main_room = preload("res://scenes/main_room.tscn")

onready var rooms = get_node("Rooms")

func _ready():
	inicia()
	var current_scene = rooms.get_children()[0]
	current_scene.connect("changed", self, "change_scene")
	
func change_scene():
	var scene = rooms.get_children()[0]
	rooms.remove_child(scene)

func inicia():
	var inicio
	inicio = main_room.instance()
	rooms.add_child(inicio)
	