extends Node2D

@onready var game_manager:Node2D = get_node("/root/Main/GameManager")
@onready var upgrade_manager:Node2D = get_node("/root/Main/UpgradeManager")

func change_stat(stat_type:int, change_value, area:Zone = null):
	if area:
		area.change_stat(stat_type, change_value)
	else:
		game_manager.change_stat(stat_type, change_value)

func enable_upgrade (upgrade_id:int):
	upgrade_manager.upgrades[upgrade_id] = true



#Insert an Event into the Queue
#Create/Remove a unit at a location
#Create/Remove a building at a location
#Add or switch an advisor
#Change a faction leader
