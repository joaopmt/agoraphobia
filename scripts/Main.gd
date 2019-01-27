extends Node

var main_room = preload("res://scenes/main_room.tscn")
#var room_2 = preload("res://scenes/room_2.tscn")
#var room_3 = preload("res://scenes/room_3.tscn")
var building = preload("res://scenes/building.tscn")

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
	var new_room
	if room_key == 0:
		room_key = 1
		#carrega room predio
		new_room = building.instance()
		rooms.add_child(new_room)
		print(rooms.get_children()[0])
		player.apply_scale(Vector2(0.4, 0.36))
		player.position = Vector2(278.791748, 449.57843)
	elif room_key == 1:
		room_key = 2