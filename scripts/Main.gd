extends Node

var main_room = preload("res://scenes/main_room.tscn")
var room_2 = preload("res://scenes/room_2.tscn")
var room_3 = preload("res://scenes/room_3.tscn")
var building = preload("res://scenes/building.tscn")
var elevator_in_anim = preload("res://scenes/elevatorInAnim.tscn")

onready var rooms = get_node("Rooms")
onready var player = get_node("Player")

var room_key
var y_in_building 
var current_is_building
var timer
var elevator_anim

func _ready():
	room_key = 0
	load_room(room_key)
	var current_scene = rooms.get_children()[0]
	#verificar
	#current_scene.connect("changed", self, "changed_room")
	current_is_building = false
	
func _process(delta):
	if current_is_building:
		if Input.is_action_just_pressed("ui_up"):
			if 960 < $Player.position.x and $Player.position.x < 1023:
				timer = Timer.new()
				timer.set_one_shot(true)
				timer.set_wait_time(2)
				timer.connect("timeout", self, "_on_Timer_timeout")
				self.add_child(timer)
				timer.start()
				elevator_anim = elevator_in_anim.instance()
				self.add_child(elevator_anim)
				elevator_anim.position = Vector2(991.564209, $Player.position.y-10)
				elevator_anim.play()
				$Player.hide()
				$Player.set_process(false)
				$Player.position.y -= 140
				room_key += 1
		elif Input.is_action_just_pressed("ui_down"):
			if 960 < $Player.position.x and $Player.position.x < 1023:
				timer = Timer.new()
				timer.set_one_shot(true)
				timer.set_wait_time(2)
				timer.connect("timeout", self, "_on_Timer_timeout")
				self.add_child(timer)
				timer.start()
				$Player.hide()
				$Player.set_process(false)
				$Player.position.y += 170
				room_key -= 1
		elif Input.is_action_just_pressed("ui_accept"):
			if 850 < $Player.position.x and $Player.position.x < 900:
				delete_building()
				load_room(room_key)
				current_is_building = false
				$Player.position = Vector2(970, 465)
				$Player.scale = Vector2(1, 1)
				$Player.MAX_SPEED = 320
	else: # current scene is a room
		if Input.is_action_just_pressed("ui_accept"):
			if 1000 < $Player.position.x and $Player.position.x < 1250:
				delete_room()
				load_building()
				current_is_building = true
				$Player.position = Vector2(893, 670 - room_key*150)
				$Player.scale = Vector2(0.4, 0.4)
				$Player.MAX_SPEED = 150
		
	
func load_building():
	var new_building = building.instance()
	self.add_child(new_building)
	
	
func delete_building():
	for child in get_children():
		if child.name == "Building":
			self.remove_child(child)
			break
	
#verificar isso
func load_room(room_key):
	print("oi")
	var new_room
	if room_key == 0:
		new_room = main_room.instance()
		rooms.add_child(new_room)
		room_key = 1
	elif room_key == 1:
		new_room = room_2.instance()
		rooms.add_child(new_room)
		room_key = 2
	elif room_key == 2:
		new_room = room_3.instance()
		rooms.add_child(new_room)
		
		
func delete_room():
	var room = rooms.get_children()[0]
	rooms.remove_child(room)
	
func _on_Timer_timeout():
	print("aaaaaaaaaa")
	$Player.show()
	$Player.set_process(true)
	self.remove_child(timer)
	self.remove_child(elevator_anim)