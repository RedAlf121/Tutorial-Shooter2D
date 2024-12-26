extends Area2D


@export var SPEED = 300.0
var direction = Vector2.RIGHT

func _physics_process(delta: float) -> void:
	move(delta)

func move(delta)->void:
	global_position += direction * SPEED * delta


func kill():
	queue_free()


func enemy_clash(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		kill()
		area.kill()
