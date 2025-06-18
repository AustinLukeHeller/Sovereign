extends Node2D

enum days{
	Sunday,
	Monday,
	Tuesday,
	Wednesday,
	Thursday,
	Friday,
	Saturday
}

enum months{
	Jan,
	Feb,
	Mar,
	Apr,
	May,
	Jun,
	Jul,
	Aug,
	Sep,
	Oct,
	Nov,
	Dec
}

@onready var time_wm_UI:RichTextLabel = get_node("/root/Main/UI/BotBar/TimeTextWM")
@onready var time_y_UI:RichTextLabel = get_node("/root/Main/UI/BotBar/TimeTextY")

@onready var hourglass:AnimatedSprite2D = get_node("/root/Main/UI/BotBar/HourglassIcon")
@onready var seasons_UI:AnimatedSprite2D = get_node("/root/Main/UI/BotBar/SeasonsIcon")
@onready var seasons_Window:AnimatedSprite2D = get_node("/root/Main/CouncilChamber/Window")

var is_paused:bool = false

const WEEKS_PER_MONTH:int = 4
const TIME_PER_DAY:float = .5

const WINTER:Array[int] = [11,0,1]
const SPRING:Array[int] = [2,3,4]
const SUMMER:Array[int] = [5,6,7]
const FALL:Array[int] = [8,9,10]

var cur_day:int = 0
var cur_week:int = 0
var cur_month:int = 0
var cur_year:int = 1
var day_timer:float = 0

signal day_tick
signal week_tick
signal month_tick

func _ready() -> void:
	time_to_text()

func _process(delta: float) -> void:
	if not is_paused:
		day_timer += delta
	
	if (day_timer >= TIME_PER_DAY):
		day_timer = 0
		cur_day += 1
		if(cur_day >= days.size()):
			cur_day = 0
			cur_week += 1
			if(cur_week >= WEEKS_PER_MONTH):
				cur_week = 0
				cur_month +=1
				if(cur_month >= months.size()):
					cur_month = 0
					cur_year+=1
				month_tick.emit()
			week_tick.emit()
		day_tick.emit()

func time_to_text() -> void:
	#var time_text:String = "Year "+str(cur_year)+", "+months.find_key(cur_month)+", Week "+str(cur_week+1) +", "+days.find_key(cur_day)
	time_wm_UI.text = "Week "+str(cur_week+1) +", "+months.find_key(cur_month)
	time_y_UI.text = "Year "+str(cur_year)


func _on_day_tick() -> void:
	hourglass.frame = cur_day

func _on_week_tick() -> void:
	time_to_text()

func _on_month_tick() -> void:
	var season = 0
	if(cur_month in WINTER):
		season = 0
	elif(cur_month in SPRING):
		season = 1
	elif(cur_month in SUMMER):
		season = 2
	elif(cur_month in FALL):
		season = 3
	
	set_season(season)

func set_season(season:int):
	seasons_UI.frame = season
	seasons_Window.frame = season
