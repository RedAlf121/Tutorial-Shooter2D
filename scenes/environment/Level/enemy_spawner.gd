extends Node

@export var enemy_class: PackedScene
@onready var enemies: Node2D = $Enemies
@onready var enemy_position: PathFollow2D = $EnemyPositionSpawn/PathFollow2D

func spawn_enemy() -> void:
	var enemy = enemy_class.instantiate()
	enemy.global_position = enemy_position.global_position
	enemy.connect("damage_player",call_hit_player)
	enemies.add_child(enemy)

func call_hit_player():
	get_tree().call_group("MainLevel","handle_life_points")
