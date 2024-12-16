extends Control

var version = ""
var onboarding = preload("res://Interface/onboarding.tscn")

func _ready():
	var config = ConfigFile.new()
	if config.load("res://config.cfg") == OK:
		version = config.get_value("general", "version", "Unknown")
	else:
		version = "Unknown"
		
	$Version.text = "version: %s" % version

# Onboarding button pressed
func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_packed(onboarding)

# Settings button pressed
func _on_settings_button_pressed() -> void:
	pass
