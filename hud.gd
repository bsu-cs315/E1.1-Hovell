extends CanvasLayer

func updateStrength(strength):
	$StrengthLabel.text = "Strength: " + str(strength)

func _on_timer_timeout() -> void:
	$InstructionsLabel.hide()
