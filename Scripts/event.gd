class_name Event extends Node2D

var id:int
var weight:int

func _init(event_id:int, event_weight:int = 1):
	id = event_id
	weight = event_weight
