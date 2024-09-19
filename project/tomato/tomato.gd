class_name Tomato
extends RigidBody2D

var _finished_throw : bool = false
var _is_stopped : bool = false

func is_landed() -> bool:
	return _is_stopped && _finished_throw
	

func _on_sleeping_state_changed() -> void:
	_is_stopped = true
	
	
func _on_body_entered(_body: Node) -> void:
	if _body.name == "GroundTileMap" or _body.name == "Tomato": _finished_throw = true
