class_name Area extends Node2D

enum factions {
	NEUTRAL,
	PLAYER,
	FACTION1,
	FACTION2,
	FACTION3,
	FACTION4
	}

var mapCollider:Area2D

var religion:float
var science:float
var food:float
var order:float
var entertainment:float
var sanitation:float

var happiness:float
var population:int

var buildings:Array[int]
var units:Array[Node2D]
var factionOwner:int

func _init(factionOwner:int = 0):
	self.factionOwner = factionOwner
	religion = 0.0
	food = 0.0
	order = 0.0
	entertainment = 0.0
	sanitation = 0.0
	happiness = 0.0
	population = 0.0
	
