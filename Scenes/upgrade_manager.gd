extends Node2D

enum upgrade_ids{
	TEST_UPGRADE_1 = 0,
	TEST_UPGRADE_2 = 1
}

var upgrades = {}

func _ready() -> void:
	for upgrade_id in upgrade_ids.values():
		upgrades[upgrade_id] = false
	
