class_name HUD extends CanvasLayer

@onready var strengthLabel : Label = $StrengthLabel
@onready var instructionsLabel : Label = $InstructionsLabel
@onready var throwsLeftLabel : Label = $ThrowsLeftLabel
@onready var handAvailableLabel : Label = $HandAvailableLabel

func updateStrength(strength) -> void:
	strengthLabel.text = "Strength: " + str(strength)

func _on_timer_timeout() -> void:
	instructionsLabel.hide()

func updateThrowsLeft(throwsLeft) -> void:
	throwsLeftLabel.text = "Throws Left: " + str(throwsLeft)

func updateHandAvailable(canThrow):
	if (canThrow):
		handAvailableLabel.text = "Hand Available"
		handAvailableLabel.modulate = Color.DARK_GREEN
	else:
		handAvailableLabel.text = "Hand Busy"
		handAvailableLabel.modulate = Color.RED
		
func handFinished():
	handAvailableLabel.text = "Ran out of tomatoes!"
	handAvailableLabel.modulate = Color.DARK_ORANGE
