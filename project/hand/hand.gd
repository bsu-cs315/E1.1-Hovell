class_name Hand
extends Node2D

signal game_finished
signal throw_finished

var throws_left : int = 2
var throw_strength : float = 500
var throw_ydirection : float = 0
var min_throw_angle : int = -90
var max_throw_angle : int = 90
var ydirection_increment : int = 10

var _tomato_object : Tomato
var _is_thrown : bool = false
var _strength_increment : int = 20

@onready var _sound_shoot : AudioStreamPlayer = $SFXPew

func _process(_delta: float) -> void:
	if _is_thrown:
		if _tomato_object.get_is_landed(): 
			_is_thrown = false
			throws_left -= 1
			throw_finished.emit()
				
	if throws_left == 0:
		game_finished.emit()
		
func addy() -> void:
	if throw_ydirection < max_throw_angle:
		throw_ydirection += ydirection_increment


func subtracty() -> void:
	if throw_ydirection > min_throw_angle:
		throw_ydirection -= ydirection_increment
		
		
func add_strength() -> void:
	throw_strength += _strength_increment
	
	
func subtract_strength() -> void:
	if throw_strength > 0:
		throw_strength -= _strength_increment


func _on_level_tomato_thrown() -> void:
	if throws_left > 0 and not _is_thrown:
		_is_thrown = true
		_sound_shoot.play()
		
		var _ydirection_power : int = 5
		var _xoffset : int = 1

		var _impulse : Vector2 = Vector2(throw_strength,throw_ydirection * _ydirection_power)
		var _position_normalized : Vector2 = Vector2(_xoffset,throw_ydirection).normalized()
		
		_tomato_object = load("res://tomato.tscn").instantiate()
		get_parent().add_child(_tomato_object)
		_tomato_object.global_position = global_position
		_tomato_object.apply_impulse(_impulse, _position_normalized)
		
