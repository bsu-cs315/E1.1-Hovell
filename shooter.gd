class_name Shooter extends RigidBody2D

@onready var sfxPew : AudioStreamPlayer = $SFXPew

var strength : float
var yDirection : float
var isShot : bool
var isLanded : bool
	
func launch() -> void:
	if (!isShot):
		sfxPew.play()
		apply_impulse(Vector2(strength,yDirection), Vector2(1, yDirection).normalized())
		gravity_scale = 0.2
		isShot = true
		
func addY() -> void:
	if (yDirection < 90 && !isShot):
		yDirection += 10

func subtractY() -> void:
	if (yDirection > -90 && !isShot):
		yDirection -= 10
		
func addStrength() -> void:
	strength += 20
	
func subtractStrength() -> void:
	if (strength > 0):
		strength -= 20

func _on_body_entered(body: Node) -> void:
	if (body.name == "GroundTileMap"): isLanded = true
	
func resetShot(pos) -> void:
	strength = 100
	yDirection = 0
	isShot = false
	isLanded = false
	gravity_scale = 0
	position = pos
