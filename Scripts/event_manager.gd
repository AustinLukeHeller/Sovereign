extends Node2D

@onready var game_manager:Node2D = get_node("/root/Main/GameManager")
@onready var upgrade_manager:Node2D = get_node("/root/Main/UpgradeManager")

var events

func _ready() -> void:
	events = preload("res://data/events.csv")
	print(events.records)
