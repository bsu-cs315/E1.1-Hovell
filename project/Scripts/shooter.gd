class_name Tomato extends RigidBody2D

var finishedThrow : bool = false
var isSleeping : bool = false

func _on_sleeping_state_changed() -> void:
	isSleeping = true
	
func _on_body_entered(body: Node) -> void:
	if (body.name == "GroundTileMap" || body.name == "Tomato"): finishedThrow = true
	
func getIsLanded() -> bool:
	return isSleeping && finishedThrow
