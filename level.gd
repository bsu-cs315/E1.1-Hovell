class_name Level extends Node2D

@onready var shooterObject : Shooter = $Shooter
@onready var hudObject : HUD = $HUD
@onready var arrowSprite : Sprite2D = $Arrow
@onready var startPosition : Marker2D = $ShooterStartPos

var shotsLeft : int = 3

func _ready() -> void:
	shooterObject.resetShot(startPosition.position)
	hudObject.updateStrength(shooterObject.strength)
	hudObject.updateShotsLeft(shotsLeft)

func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("launch")):
		shooterObject.launch()
		arrowSprite.hide()

	if (Input.is_action_just_pressed("addStrength")):
		shooterObject.addStrength()
		hudObject.updateStrength(shooterObject.strength)
		
	if (Input.is_action_just_pressed("subtractStrength")):
		shooterObject.subtractStrength()
		hudObject.updateStrength(shooterObject.strength)
		
	if (Input.is_action_just_pressed("addY")):
		shooterObject.addY()
		if (shooterObject.yDirection < 90): arrowSprite.rotation_degrees += 10
		
	if (Input.is_action_just_pressed("subtractY")):
		shooterObject.subtractY()
		if (shooterObject.yDirection > -90): arrowSprite.rotation_degrees -= 10

func _on_shooter_sleeping_state_changed() -> void:
	if (shooterObject.isLanded):
		shotsLeft -= 1
		hudObject.updateShotsLeft(shotsLeft)
		if (shotsLeft > 0):
			shooterObject.resetShot(startPosition.position)
			arrowSprite.show()
		
