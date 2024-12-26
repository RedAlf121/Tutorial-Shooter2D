extends CanvasLayer

@onready var backgrounds = {
	"background": $Background,
	"planet": $Planet,
	"stars": $Stars
}
@onready var ticks = 8
@onready var direction = Vector2.LEFT

func handle_parallax(delta:float)-> void:
	var layer = 1
	for background in backgrounds.values():
		if background is Array:
			for item in background:
				update_background(item,delta)
		else:
			update_background(background,delta)
		layer+=1
func update_background(background,delta):
	background.scroll_base_offset+=direction*ticks*layer*delta
