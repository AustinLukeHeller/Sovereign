extends Node2D

@onready var game_manager:Node2D = get_node("/root/Main/GameManager")

var buildings

func _ready() -> void:
	buildings = preload("res://data/buildings.csv")
	print(buildings.records)
