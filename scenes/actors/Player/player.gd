extends CharacterBody2D

@export var bullet: PackedScene
@export var SPEED = 150.0
@onready var aim: Marker2D = $Utils/Aim
@onready var shoot_sprite: Sprite2D = $ShootSprite

@onready var viewport = get_viewport_rect().size
var direction = Vector2.ZERO
var animations = {
	"0": "idle",
	"1": "down",
	"-1": "up"
}


func _physics_process(delta: float) -> void:
	handle_movement()
	handle_animation()
	#clamp from_half_image size to viewport-half_image_size
	position.x = clamp(position.x,13,viewport.x-13)
	position.y = clamp(position.y,10,viewport.y-10)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		handle_shoot()

func handle_animation():
	$SpaceShipSprite.play(animations[str(direction.y)])

func handle_movement():
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	velocity = direction.normalized()*SPEED
	move_and_slide()

func handle_shoot():
	shoot_sprite.show()
	var bullet_instance = bullet.instantiate()
	bullet_instance.global_position = aim.global_position
	get_tree().call_group("MainLevel","add_child",bullet_instance)
	await get_tree().create_timer(.08).timeout
	shoot_sprite.hide()
