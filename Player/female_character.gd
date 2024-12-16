extends CharacterBody3D


@export var speed = 3
@export var turn_speed = 2.5

@onready var animation_player = $Pivot/Player/AnimationPlayer

var target_velocity = Vector3.ZERO
var target_direction = Vector3.ZERO

func _physics_process(delta):
	var direction = Vector3.ZERO

	# Handle input for movement relative to character's local axes
	if Input.is_action_pressed("move_right"):
		direction += transform.basis.x
	if Input.is_action_pressed("move_left"):
		direction -= transform.basis.x
	if Input.is_action_pressed("move_backward"):
		direction -= transform.basis.z
	if Input.is_action_pressed("move_forward"):
		direction += transform.basis.z

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		target_direction = direction

		# Move player in the direction
		target_velocity = direction * speed

		# Start animation if not already playing
		if not animation_player.is_playing():
			animation_player.play("metarigAction")
	else:
		target_velocity = Vector3.ZERO

		# Stop animation if the player is not moving
		if animation_player.is_playing():
			animation_player.stop()

	# Smoothly rotate to face the target direction
	if target_direction != Vector3.ZERO:
		var current_forward = -global_transform.basis.z.normalized()
		var angle_to_target = current_forward.angle_to(target_direction)

		if angle_to_target > 0.01: # Avoid jittering for small angles
			var rotation_axis = current_forward.cross(target_direction).normalized()
			
			# Check if rotation axis is non-zero
			if rotation_axis != Vector3.ZERO:
				var smooth_rotation = Quaternion(rotation_axis, angle_to_target * delta * turn_speed)
				global_transform.basis = Basis(smooth_rotation) * global_transform.basis

	velocity = target_velocity
	move_and_slide()
