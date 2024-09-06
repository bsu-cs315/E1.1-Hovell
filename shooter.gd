class_name Shooter
extends RigidBody2D

var strength : float = 100
var yDirection : float = 0
var isShot : bool = false
var isLanded : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gravity_scale = 0
	
func launch() -> void:
	if (!isShot):
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
