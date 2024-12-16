extends Node3D


@onready var male_character = $MaleCharacter
@onready var female_character = $FemaleCharacter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Hide both characters initially
	male_character.visible = false
	female_character.visible = false
	
	# Show the chosen character
	if Global.selected_character == "male":
		male_character.visible = true
	elif Global.selected_character == "female":
		female_character.visible = true
