extends Node3D

@export var ceiling_light: NodePath
@export var character_distance: float = 1.0
@export var energy_bar: NodePath  # Reference to the energy bar
@export var energy_gain_amount: float = 10.0  # How much energy is gained when turning off the light

var light
var energy_bar_node
var light_was_on: bool = true  # Track initial light state

func _ready():
	light = get_node(ceiling_light)
	energy_bar_node = get_node(energy_bar)
	
	# Ensure initial state is tracked
	light_was_on = light.visible

func _process(_delta):
	if Input.is_action_just_pressed("interact") and is_player_near():
		toggle_light()

func toggle_light():
	if light:
		# Toggle light visibility
		light.visible = !light.visible
		
		# Check if the light was on before and is now off
		if light_was_on and not light.visible:
			# Gain energy for turning off the light
			if energy_bar_node:
				energy_bar_node.add_energy(energy_gain_amount)
		
		# Update the tracked light state
		light_was_on = light.visible

func is_player_near() -> bool:
	var player = get_node("../MaleCharacter")
	return global_position.distance_to(player.global_position) < character_distance
