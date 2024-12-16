extends Node2D


# Quit button pressed
func _on_quit_button_pressed() -> void:
	get_tree().quit(0)

# Choose male character
func _on_male_button_pressed() -> void:
	Global.selected_character = "male"
	get_tree().change_scene_to_file("res://World/living_room.tscn")

# Choose female character
func _on_female_button_pressed() -> void:
	Global.selected_character = "female"
	get_tree().change_scene_to_file("res://World/living_room.tscn")
