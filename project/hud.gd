class_name HUD
extends CanvasLayer

@onready var _strength_label : Label = $StrengthLabel
@onready var _instructions_label : Label = $InstructionsLabel
@onready var _throws_left_label : Label = $ThrowsLeftLabel
@onready var _hand_available_label : Label = $HandAvailableLabel

func update_strength_label(_strength) -> void:
	_strength_label.text = "Strength: " + str(_strength)


func update_throws_label(_throwsLeft) -> void:
	_throws_left_label.text = "Throws Left: " + str(_throwsLeft)


func update_hand_label(_canThrow):
	if (_canThrow):
		_hand_available_label.text = "Hand Available"
		_hand_available_label.modulate = Color.DARK_GREEN
	else:
		_hand_available_label.text = "Hand Busy"
		_hand_available_label.modulate = Color.RED


func _on_timer_timeout() -> void:
	_instructions_label.hide()
