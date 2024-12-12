extends Node2D


var male_character = preload("res://World/living_room.tscn")

# Quit button pressed
func _on_quit_button_pressed() -> void:
	get_tree().quit(0)

# Choose male character
func _on_male_button_pressed() -> void:
	get_tree().change_scene_to_packed(male_character)

# Choose female character
func _on_female_button_pressed() -> void:
	pass # Replace with function body.
