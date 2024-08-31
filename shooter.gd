extends RigidBody2D

var strength : float = 100
var yDirection : float = 0
var isShot : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gravity_scale = 0
	
func launch():
	if (!isShot):
		apply_impulse(Vector2(strength,yDirection), Vector2(1, yDirection).normalized())
		gravity_scale = 0.2
		isShot = true
		
func addY():
	if (yDirection < 90 && !isShot):
		yDirection += 10

func subtractY():
	if (yDirection > -90 && !isShot):
		yDirection -= 10
		
func addStrength():
	strength += 20
	
func subtractStrength():
	if (strength > 0):
		strength -= 20
#
#func _on_body_entered(body: Node) -> void:
	#if (body.name == "GroundTileMap"): get_tree().change_scene_to_file("res://level.tscn")
#	fix error: "Removing a CollisionObject node during a physics callback is not allowed"
