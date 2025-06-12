extends Node2D

@onready var game_manager:Node2D = get_node("/root/Main/GameManager")
@onready var upgrade_manager:Node2D = get_node("/root/Main/UpgradeManager")
#const event = preload("res://scripts/event.gd")

var events
var event_queue:Array[Event] = []

func _ready() -> void:
	events = preload("res://data/events.csv")
	print(events.records)
	
func add_to_queue(event_id:int, event_weight:int = 1):
	event_queue.append(Event.new(event_id, event_weight))
