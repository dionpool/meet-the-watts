extends Node3D


@onready var animation_player = $AnimationPlayer

func _ready():
	animation_player.play("doorOpen")
	animation_player.animation_finished.connect(self._on_animation_finished)

# Function to handle the animation switch
func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "doorOpen":
		animation_player.play("doorClose")
	elif anim_name == "doorClose":
		animation_player.play("doorOpen")
