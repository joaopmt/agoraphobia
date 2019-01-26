extends RichTextLabel

export(String, FILE, "*.txt") var filepath
var dialog = {}	
var page = 0

signal done

func _ready():
	var f = File.new()
	f.open(filepath, 1)
	while not f.eof_reached():
		var line = f.get_line()
		print(line)
		dialog[page] = line
		page += 1
	f.close()
	set_bbcode(dialog[0])
	page = 1

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
			else:
				emit_signal("done")
		else:
			set_visible_characters(get_total_character_count())
	pass


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
