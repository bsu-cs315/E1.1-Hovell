class_name HUD extends CanvasLayer

@onready var strengthLabel : Label = $StrengthLabel
@onready var instructionsLabel : Label = $InstructionsLabel
@onready var shotsLeftLabel : Label = $ShotsLeftLabel

func updateStrength(strength) -> void:
	strengthLabel.text = "Strength: " + str(strength)

func _on_timer_timeout() -> void:
	instructionsLabel.hide()

func updateShotsLeft(shotsLeft) -> void:
	shotsLeftLabel.text = "Shots Left: " + str(shotsLeft)
