extends Node

var main_room = preload("res://scenes/main_room.tscn")

onready var rooms = get_node("Rooms")
onready var player = get_node("Player")

var room_key = 0

func _ready():
	inicia()
	var current_scene = rooms.get_children()[0]
	current_scene.connect("changed", self, "change_scene")
	
func change_scene():
	var scene = rooms.get_children()[0]
	rooms.remove_child(scene)
	load_room()

func inicia():
	var inicio
	inicio = main_room.instance()
	rooms.add_child(inicio)
	
func load_room():
	if room_key == 0:
		room_key = 1
		inicia()
		print(rooms.get_children()[0])
		player.position = Vector2(278.791748, 449.57843)