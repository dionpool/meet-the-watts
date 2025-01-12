extends Button


var result_screen = preload("res://Interface/result_screen.tscn")

# Quit button pressed
func _on_quit_button_pressed() -> void:
	get_tree().change_scene_to_packed(result_screen)
