extends Node2D

enum headers{
	ID,
	NAME,
	TEXT,
	ICON,
	PRIORITY,
	NAME1,
	TEXT1,
	COND1,
	ACTION1,
	NAME2,
	TEXT2,
	COND2,
	ACTION2,
	NAME3,
	TEXT3,
	COND3,
	ACTION3
}

@onready var game_manager:Node2D = get_node("/root/Main/GameManager")
@onready var upgrade_manager:Node2D = get_node("/root/Main/UpgradeManager")

@onready var event_panel:Control = get_node("/root/Main/EventPanel")
@onready var event_title:RichTextLabel = get_node("/root/Main/EventPanel/EventTitle/EventTitleText")
@onready var event_body:RichTextLabel = get_node("/root/Main/EventPanel/EventBody/EventBodyText")
@onready var event_option_1:RichTextLabel = get_node("/root/Main/EventPanel/EventOption1/EventOptionText1")
@onready var event_option_2:RichTextLabel = get_node("/root/Main/EventPanel/EventOption2/EventOptionText2")
@onready var event_option_3:RichTextLabel = get_node("/root/Main/EventPanel/EventOption3/EventOptionText3")
#const event = preload("res://scripts/event.gd")

var events_csv
var events
var event_queue:Array[Event] = []

func _ready() -> void:
	event_panel.visible = false
	events_csv = preload("res://data/events.csv")
	events = events_csv.records
	events.remove_at(0) #remove header row
	
	display_event(0)
	
			
func display_event(event_id:int):
	var event_row:int = -1
	var row_counter = 0
	
	#find which row in the csv file that the ID is in
	for event in events:
		print(event)
		if(int(event[headers.ID]) == event_id):
			event_row = row_counter
		row_counter += 1
	
	event_title.text = "[color=blue]" +str(events[event_row][headers.NAME])+ "[/color]"
	event_body.text = str(events[event_row][headers.TEXT])
	event_option_1.text = "[color=blue]" +str(events[event_row][headers.NAME1]) + "[/color]\n" + str(events[event_row][headers.TEXT1])
	event_option_2.text = "[color=blue]" +str(events[event_row][headers.NAME2]) + "[/color]\n" + str(events[event_row][headers.TEXT2])
	event_option_3.text = "[color=blue]" +str(events[event_row][headers.NAME3]) + "[/color]\n" + str(events[event_row][headers.TEXT3])
	event_panel.visible = true

func next_event_from_queue() -> int:
	var weighting_list:Array[int] = []
	
	for event in event_queue:
		for n in event.weight:
			weighting_list.append(event.id)
	
	var chosen_event = weighting_list.pick_random()
	
	event_queue.remove_at(event_queue.find(chosen_event))
	
	return chosen_event.id

func add_to_queue(event_id:int, event_weight:int = 1):
	event_queue.append(Event.new(event_id, event_weight))

func choice_selection (button_num:int):
	print("Chose option"+str(button_num))
	event_panel.visible = false
