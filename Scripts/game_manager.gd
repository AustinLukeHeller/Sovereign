extends Node2D

enum stats {
	GOLD,
	HAPPINESS,
	RELIGION,
	SCIENCE,
	FOOD,
	ORDER,
	ENTERTAINMENT,
	SANITATION,
	MAGIC,
	AESTHETICS,
	MORALS,
	TAX_RATE,
	POPULATION,
	FACTION1,
	FACTION2,
	FACTION3,
	FACTION4
}

const PLAYER_NAME:String = "Player"
const STARTING_GOLD:int = 10
const STARTING_HAPPINESS:float = 10.0
const STARTING_TAX_RATE:float = 0.10

var player_faction:Faction

var all_zones = {}

func _ready() -> void:
	player_faction = Faction.new(PLAYER_NAME, self, STARTING_GOLD, STARTING_HAPPINESS, STARTING_TAX_RATE)

func register_zone (zone):
	all_zones[zone.zone_name] = zone
