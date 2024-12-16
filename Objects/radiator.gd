extends Node3D


@export var radiator_foil: NodePath
@export var character_distance: float = 1.0

var foil

func _ready():
	foil = get_node(radiator_foil)

func _process(_delta):
	if Input.is_action_just_pressed("interact") and is_player_near():
		toggle_foil()

func toggle_foil():
	if foil:
		foil.visible = !foil.visible

func is_player_near() -> bool:
	var player = get_node("../MaleCharacter")
	return global_position.distance_to(player.global_position) < character_distance
