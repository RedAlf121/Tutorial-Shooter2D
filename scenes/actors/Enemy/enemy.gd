extends Area2D


@export var SPEED = 100.0
signal damage_player
var direction = Vector2.LEFT

func _ready() -> void:
	$AnimatedSprite2D.play("enemy")

func _physics_process(delta: float) -> void:
	move(delta)

func move(delta)->void:
	global_position += direction * SPEED * delta

func die(area: Area2D) -> void:
	if area.is_in_group("Bullet"):
		kill()

func damage(body: Node2D) -> void:
	if body.is_in_group("Player"):
		emit_signal("damage_player")

func kill():
	queue_free()
