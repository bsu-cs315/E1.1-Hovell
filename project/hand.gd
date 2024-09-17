class_name Hand
extends Node2D

signal game_finished
signal throw_finished

var throw_strength : float = 500
var throw_ydirection : float = 0
var _tomato_object : Tomato
var _is_thrown : bool = false
var throws_left : int = 2

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
	if throw_ydirection < 90:
		throw_ydirection += 10


func subtracty() -> void:
	if throw_ydirection > -90:
		throw_ydirection -= 10
		
		
func add_strength() -> void:
	throw_strength += 20
	
	
func subtract_strength() -> void:
	if throw_strength > 0:
		throw_strength -= 20


func _on_level_tomato_thrown() -> void:
	if throws_left > 0 and not _is_thrown:
		_sound_shoot.play()
		_tomato_object = load("res://tomato.tscn").instantiate()
		get_parent().add_child(_tomato_object)
		_tomato_object.global_position = global_position
		_tomato_object.apply_impulse(Vector2(throw_strength,throw_ydirection * 5), Vector2(1,throw_ydirection).normalized())
		_is_thrown = true
