extends Node2D

@onready var game_manager:Node2D = get_node("/root/Main/GameManager")
@onready var upgrade_manager:Node2D = get_node("/root/Main/UpgradeManager")
#const event = preload("res://scripts/event.gd")

var events
var event_queue:Array[Event] = []

func _ready() -> void:
	events = preload("res://data/events.csv")
	print(events.records)

func next_event() -> int:
	var weighting_list:Array[int] = []
	
	for event in events:
		for n in event.weight:
			weighting_list.append(event.id)
	
	var chosen_event = weighting_list.pick_random()
	
	event_queue.remove_at(event_queue.find(chosen_event))
	
	return chosen_event.id


	
func add_to_queue(event_id:int, event_weight:int = 1):
	event_queue.append(Event.new(event_id, event_weight))
