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

var PLAYER_NAME:String = "Player"
const STARTING_GOLD:int = 10
const STARTING_HAPPINESS:float = 10.0
const STARTING_TAX_RATE:float = 0.10

@onready var gold_text:RichTextLabel = get_node("/root/Main/UI/TopBar/GoldText")
@onready var happiness_icon:AnimatedSprite2D = get_node("/root/Main/UI/TopBar/HappinessIcon")

var player_faction:Faction

var all_zones = {}

func _ready() -> void:
	player_faction = Faction.new(PLAYER_NAME, self, STARTING_GOLD, STARTING_HAPPINESS, STARTING_TAX_RATE)
	ui_update(stats.GOLD)
	ui_update(stats.HAPPINESS)
	
func register_zone (zone):
	all_zones[zone.zone_name] = zone
	
func change_player_stat(stat_type:int, change_value):
	player_faction.change_stat(stat_type, change_value)
	ui_update(stat_type)


func set_player_stat (stat_type:int, set_value):
	player_faction.set_stat(stat_type, set_value)
	ui_update(stat_type)
	
func ui_update(stat_type):
	if stat_type == stats.GOLD:
		update_gold()
	elif stat_type == stats.HAPPINESS:
		update_happiness()

func update_happiness():
	var cur_happiness = player_faction.get_stat(stats.HAPPINESS)
	
	if(cur_happiness > 15):
		happiness_icon.frame = 0
	elif(cur_happiness <= 15 and cur_happiness > 5):
		happiness_icon.frame = 1
	elif(cur_happiness <= 5 and cur_happiness > -5):
		happiness_icon.frame = 2
	elif(cur_happiness <= -5 and cur_happiness > -15):
		happiness_icon.frame = 3
	elif(cur_happiness < -15):
		happiness_icon.frame = 4
	

func update_gold():
	gold_text.text = str(player_faction.gold)
