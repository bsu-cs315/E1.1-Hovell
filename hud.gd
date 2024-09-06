class_name HUD

extends CanvasLayer

func updateStrength(strength) -> void:
	$StrengthLabel.text = "Strength: " + str(strength)

func _on_timer_timeout() -> void:
	$InstructionsLabel.hide()
