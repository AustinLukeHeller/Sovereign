class_name Faction extends Node2D

@onready var game_manager:Node2D = get_node("/root/Main/GameManager")
@export var faction_name = "Unnamed Faction"

var gold:int
var happiness:float
var tax_rate:float
var magic:float
var aesthetics:float
var morals:float

var controlled_zones = {}

func _init(imported_faction_name = faction_name, imported_game_manager = get_node("/root/Main/GameManager"), starting_gold:int = 0, starting_happiness:float = 0.0, starting_tax_rate:float = 0.0, starting_magic:float = 0.0, starting_aesthetics:float = 0.0, starting_morals:float = 0.0):
	self.game_manager = imported_game_manager
	self.faction_name = imported_faction_name
	set_stat(game_manager.stats.GOLD, starting_gold)
	set_stat(game_manager.stats.HAPPINESS, starting_happiness)
	set_stat(game_manager.stats.TAX_RATE, starting_tax_rate)
	set_stat(game_manager.stats.MAGIC, starting_magic)
	set_stat(game_manager.stats.AESTHETICS, starting_aesthetics)
	set_stat(game_manager.stats.MORALS, starting_morals)
	
func gain_zone (zone):
	controlled_zones[zone.zone_name] = zone

func lose_zone (zone):
	controlled_zones[zone.zone_name].erase()
	
func change_stat (stat_type:int, change_value):
	match stat_type:
		game_manager.stats.GOLD:
			self.gold += change_value
		game_manager.stats.HAPPINESS:
			self.happiness += change_value
		game_manager.stats.MAGIC:
			self.magic += change_value
		game_manager.stats.AESTHETICS:
			self.aesthetics += change_value	
		game_manager.stats.MORALS:
			self.morals += change_value
		game_manager.stats.TAX_RATE:
			self.tax_rate += change_value

func set_stat (stat_type:int, set_value):
	match stat_type:
		game_manager.stats.GOLD:
			self.gold = set_value
		game_manager.stats.HAPPINESS:
			self.happiness = set_value
		game_manager.stats.MAGIC:
			self.magic = set_value
		game_manager.stats.AESTHETICS:
			self.aesthetics = set_value	
		game_manager.stats.MORALS:
			self.morals = set_value
		game_manager.stats.TAX_RATE:
			self.tax_rate = set_value

func get_stat(stat_type:int):
	var stat_to_return
	match stat_type:
		game_manager.stats.GOLD:
			stat_to_return = self.gold
		game_manager.stats.HAPPINESS:
			stat_to_return = self.happiness
		game_manager.stats.MAGIC:
			stat_to_return = self.magic
		game_manager.stats.AESTHETICS:
			stat_to_return = self.aesthetics
		game_manager.stats.MORALS:
			stat_to_return = self.morals
		game_manager.stats.TAX_RATE:
			stat_to_return = self.tax_rate
		game_manager.stats.RELIGION:
			stat_to_return = get_average(game_manager.stats.RELIGION)
		game_manager.stats.SCIENCE:
			stat_to_return = get_average(game_manager.stats.SCIENCE)
		game_manager.stats.ORDER:
			stat_to_return = get_average(game_manager.stats.ORDER)
		game_manager.stats.ENTERTAINMENT:
			stat_to_return = get_average(game_manager.stats.ENTERTAINMENT)
		game_manager.stats.SANITATION:
			stat_to_return = get_average(game_manager.stats.SANITATION)
		game_manager.stats.HAPPINESS:
			stat_to_return = get_average(game_manager.stats.HAPPINESS)
		game_manager.stats.POPULATION:
			stat_to_return = get_total(game_manager.stats.POPULATION)
		
	return stat_to_return

func get_average(stat_type):
	
	if controlled_zones.is_empty():
		print(faction_name+" controls no zones!")
		return 0
	
	var total:float = 0.0
	var tally:int = 0
	
	for zonekey in controlled_zones.keys():
		total += controlled_zones[zonekey].get_stat(stat_type)
		tally += 1
		
	return total/tally

func get_total(stat_type):
	
	if controlled_zones.is_empty():
		print(faction_name+" controls no zones!")
		return 0
	
	var total:float = 0.0
	
	for zonekey in controlled_zones.keys():
		total += controlled_zones[zonekey].get_stat(stat_type)
	
	return total
