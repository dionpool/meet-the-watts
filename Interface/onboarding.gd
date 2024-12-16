extends Node2D


var choose_character = preload("res://Interface/choose_character.tscn")

# Onboarding button pressed
func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_packed(choose_character)
