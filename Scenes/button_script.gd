extends NinePatchRect

@export var button_num:int = 0

@onready var event_manager:Node2D = get_node("/root/Main/EventManager")
var mousing_over:bool = false

func _on_mouse_entered() -> void:
	self.modulate = Color(0.5, 0.5, 0.5, 1)
	mousing_over = true

func _on_mouse_exited() -> void:
	self.modulate = Color(1, 1, 1, 1)
	mousing_over = false

func button_pressed():
	self.modulate = Color(0.1, 0.1, 0.1, 1)
	event_manager.choice_selection(button_num)

func _input(event):
	if event.is_action_pressed("click") and mousing_over:
		button_pressed()
