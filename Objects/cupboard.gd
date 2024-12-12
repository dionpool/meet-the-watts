extends Node3D

@export var character_distance: float = 1.0

var animation_player : AnimationPlayer
var door_open = false

func _ready():
	# Set animation player node
	animation_player = get_node("cupboard/AnimationPlayer")

# Open/close door when player presses the "E" key
func _process(_delta):
	if Input.is_action_just_pressed("interact") and is_player_near():
		toggle_door()

# Check if the left door is open or closed
# Open when closed and close when it's open
func toggle_door():
	if door_open:
		animation_player.play("doorLeftClose")
	else:
		animation_player.play("doorLeftOpen")
	
	door_open = !door_open

# Check the position of the player
func is_player_near() -> bool:
	var player = get_node("../MaleCharacter")  # Update path if needed
	return global_position.distance_to(player.global_position) < character_distance
