class_name Zone extends Node2D

enum factions {
	NEUTRAL,
	PLAYER,
	FACTION1,
	FACTION2,
	FACTION3,
	FACTION4
	}

@onready var game_manager:Node2D = get_node("/root/Main/GameManager")
@export var zone_name = "Unnamed Zone"
@export var is_difficult_terrain = false

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
var faction_owner:int

func _init(imported_faction_owner:int = 0):
	self.faction_owner = imported_faction_owner
	religion = 0.0
	food = 0.0
	order = 0.0
	entertainment = 0.0
	sanitation = 0.0
	happiness = 0.0
	population = 0
	
func _ready() -> void:
	if game_manager:
		game_manager.register_zone(self)
	else:
		print("Zone couldn't find GameManager")
	
func change_stat(stat_type:int, change_value):
	match stat_type:
		game_manager.stats.RELIGION:
			religion+=change_value
		game_manager.stats.SCIENCE:
			science+=change_value
		game_manager.stats.ORDER:
			order+=change_value
		game_manager.stats.ENTERTAINMENT:
			entertainment+=change_value
		game_manager.stats.SANITATION:
			sanitation+=change_value
		game_manager.stats.HAPPINESS:
			happiness+=change_value
		game_manager.stats.POPULATION:
			population+=change_value

func get_stat(stat_type:int):
	var stat_to_return
	
	match stat_type:
		game_manager.stats.RELIGION:
			stat_to_return = religion
		game_manager.stats.SCIENCE:
			stat_to_return = science
		game_manager.stats.ORDER:
			stat_to_return = order
		game_manager.stats.ENTERTAINMENT:
			stat_to_return = entertainment
		game_manager.stats.SANITATION:
			stat_to_return = sanitation
		game_manager.stats.HAPPINESS:
			stat_to_return = happiness
		game_manager.stats.POPULATION:
			stat_to_return = population
	
	return stat_to_return
