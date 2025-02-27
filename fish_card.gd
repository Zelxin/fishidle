extends Control


@onready var fish_name_label: Label = $FishName
@onready var fish_image: TextureRect = $FishImage
@onready var fish_info_label: Label = $FishInfo

func set_fish_data(name: String, image: Texture, info: String):
	fish_name_label.text = name
	fish_image.texture = image
	fish_info_label.text = info

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
