extends Node2D


@onready var enemy_position: PathFollow2D = $EnemySpawner/EnemyPositionSpawn/PathFollow2D


func _ready() -> void:
	Score.reset()

func _process(delta: float) -> void:
	enemy_position.set_progress(enemy_position.get_progress()+80*delta)
	$Parallax.handle_parallax(delta)

func handle_life_points():
	Score.update("update_credits",Score.POINTS.DOWN)
	if Score.player_life == 0:
		get_tree().reload_current_scene()
