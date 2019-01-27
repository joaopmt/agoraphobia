extends RichTextLabel

export(String, FILE, "*.txt") var filepath
var dialog = {}	
var page = 0
var player_query_char = "="
var next_dialog = false
var yes_was_pressed = false
var no_was_pressed = false

signal done
signal player_query_signal

func _ready():
	set_process(true)
	var f = File.new()
	f.open(filepath, 1)
	while not f.eof_reached():
		var line = f.get_line()
		dialog[page] = line
		page += 1
	f.close()
	set_bbcode(dialog[0])
	page = 0

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") or next_dialog:
		if next_dialog:
			next_dialog = false
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size() - 1:				#TODO -2 MAY BE NEEDED
				page += 1
				if dialog[page][0] == "=":
					emit_signal("player_query_signal")
					set_process(false)
				else:
					var aux
					if yes_was_pressed:
						aux = dialog[page].right(4)
						yes_was_pressed = false
						set_bbcode(aux)
						page += 1
					elif no_was_pressed:
						page += 1
						aux = dialog[page].right(4)
						no_was_pressed = false
						set_bbcode(aux)
					else:
						set_bbcode(dialog[page])
					set_visible_characters(0)
			else:
				emit_signal("done")
				page += 1
		else:
			set_visible_characters(get_total_character_count())
	pass


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
