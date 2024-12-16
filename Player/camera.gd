extends Camera3D

@export var follow_offset: Vector3 = Vector3(0, 1, -3)  # Negative Z to position the camera behind the character
@export var follow_speed: float = 5.0

var target: CharacterBody3D

func _ready():
	# After the scene is loaded, check the global selected character and assign the target
	match Global.selected_character:
		"male":
			target = get_node("/root/LivingRoom/MaleCharacter")  # Adjust path as needed
		"female":
			target = get_node("/root/LivingRoom/FemaleCharacter")  # Adjust path as needed

	if not target:
		push_error("Camera3D's target is not a valid CharacterBody3D!")

func _process(delta):
	if target:
		# Calculate the desired camera position
		var desired_position = target.global_transform.origin + target.global_transform.basis.z * follow_offset.z
		desired_position.y += follow_offset.y

		var target_position = desired_position

		# Smoothly move the camera to the target position
		global_transform.origin = lerp(global_transform.origin, target_position, follow_speed * delta)

		# Make the camera look at the character
		look_at(target.global_transform.origin + Vector3(0, follow_offset.y, 0))
