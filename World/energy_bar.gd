extends Control

# Energy bar configuration
@export var max_energy: float = 100.0
@export var bar_width: float = 300.0  # Explicit width control
@export var bar_height: float = 50.0  # Explicit height control

# Texture references
@export var base_empty_texture: Texture2D
@export var red_overlay: Texture2D
@export var yellow_overlay: Texture2D
@export var green_overlay: Texture2D

# Threshold points for color changes
@export var low_threshold: float = 33.0
@export var high_threshold: float = 66.0

# Node references
@onready var progress_bar: TextureProgressBar = $ProgressBar
@onready var overlay_texture: TextureRect = $OverlayTexture

func _ready():
	# Configure the container (self)
	custom_minimum_size = Vector2(bar_width, bar_height)
	size = Vector2(bar_width, bar_height)
	
	# Configure progress bar
	progress_bar.custom_minimum_size = Vector2(bar_width, bar_height)
	progress_bar.size = Vector2(bar_width, bar_height)
	progress_bar.texture_under = base_empty_texture
	progress_bar.texture_progress = base_empty_texture
	progress_bar.texture_over = null
	progress_bar.max_value = max_energy
	
	# Configure overlay
	overlay_texture.custom_minimum_size = Vector2(bar_width, bar_height)
	overlay_texture.size = Vector2(bar_width, bar_height)
	overlay_texture.expand_mode = TextureRect.EXPAND_KEEP_SIZE
	overlay_texture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	
	# Center the container
	anchor_right = 1
	anchor_left = 1
	anchor_top = 2
	anchor_bottom = 1
	
	# Reset position
	position = Vector2(-bar_width/2, -bar_height)

func _process(delta):
	update_overlay()

func add_energy(amount: float):
	progress_bar.value = min(max_energy, progress_bar.value + amount)
	update_overlay()

func update_overlay():
	var current_energy = progress_bar.value
	var percentage = current_energy / max_energy * 100.0
	
	# Clear previous overlay first
	overlay_texture.texture = null
	
	# Apply new overlay based on thresholds
	if percentage >= high_threshold:
		overlay_texture.texture = green_overlay
	elif percentage >= low_threshold:
		overlay_texture.texture = yellow_overlay
	elif percentage > 0:
		overlay_texture.texture = red_overlay

func get_current_energy() -> float:
	return progress_bar.value

func is_energy_threshold_met(threshold: float) -> bool:
	return progress_bar.value >= threshold
