extends Area2D

export(String, FILE, "*.tscn") var next_scene

func _physics_process(delta):
	for body in get_overlapping_bodies():
		if body.name == "Player":
			get_tree().change_scene(next_scene)