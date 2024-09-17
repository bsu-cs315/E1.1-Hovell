class_name Tomato
extends RigidBody2D

var finished_throw : bool = false
var is_stopped : bool = false


func get_is_landed() -> bool:
	return is_stopped && finished_throw
	

func _on_sleeping_state_changed() -> void:
	is_stopped = true
	
	
func _on_body_entered(_body: Node) -> void:
	if _body.name == "GroundTileMap" or _body.name == "Tomato":
		finished_throw = true
	
	
