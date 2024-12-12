extends Node3D

@export var big_lamp_left: NodePath
@export var character_distance: float = 1.0

var light

func _ready():
	light = get_node(big_lamp_left)

func _process(_delta):
	if Input.is_action_just_pressed("interact") and is_player_near():
		toggle_light()

func toggle_light():
	if light:
		light.visible = !light.visible

func is_player_near() -> bool:
	var player = get_node("../MaleCharacter")
	return global_position.distance_to(player.global_position) < character_distance
