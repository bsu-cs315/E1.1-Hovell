extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HUD.updateStrength($Shooter.strength)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("launch")):
		$Shooter.launch()
		$Arrow.hide()

	if (Input.is_action_just_pressed("addStrength")):
		$Shooter.addStrength()
		$HUD.updateStrength($Shooter.strength)
		
	if (Input.is_action_just_pressed("subtractStrength")):
		$Shooter.subtractStrength()
		$HUD.updateStrength($Shooter.strength)
		
	if (Input.is_action_just_pressed("addY")):
		$Shooter.addY()
		if ($Shooter.yDirection < 90): $Arrow.rotation_degrees += 10
		
	if (Input.is_action_just_pressed("subtractY")):
		$Shooter.subtractY()
		if ($Shooter.yDirection > -90): $Arrow.rotation_degrees -= 10
