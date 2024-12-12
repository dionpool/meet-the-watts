extends Button


# Quit button pressed
func _on_quit_button_pressed() -> void:
	get_tree().quit(0)
