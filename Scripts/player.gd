extends Faction

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
