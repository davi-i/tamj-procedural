extends MeshInstance3D

var width = 256
var height = 256
@export var noise: FastNoiseLite
@export var noise_scale = 20

@onready var material = mesh.surface_get_material(0) as ShaderMaterial

# Called when the node enters the scene tree for the first time.
#func _process(delta: float) -> void:
	#print(material)
	#material.set_shader_parameter("height/map", ImageTexture.create_from_image(generate_image()))

func generate_image() -> Image:
	var image = Image.create_empty(width, height, false, Image.FORMAT_RGBA4444)
	for x in range(width):
		for y in range(height):
			image.set_pixel(x, y, generate_color(x,y))
	return image
	
func generate_color(x: int, y: int) -> Color:
	var sample = noise.get_noise_2d(x * noise_scale, y * noise_scale)
	return Color(sample, sample, sample)
