class_name Shooter extends RigidBody2D

var touchingGround : bool = false
var isSleeping : bool = false

func _on_sleeping_state_changed() -> void:
	isSleeping = true
	

func _on_body_entered(body: Node) -> void:
	if (body.name == "GroundTileMap" || body.name == "Shooter"): touchingGround = true
	
func getIsLanded() -> bool:
	return isSleeping && touchingGround
