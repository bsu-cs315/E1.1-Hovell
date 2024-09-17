class_name Hand
extends Node2D

signal game_finished

var throw_strength : float = 500
var throw_ydirection : float = 0
var _tomato_object : Tomato
var _is_thrown : bool = false
var _throws_left : int = 1

@onready var sound_shoot : AudioStreamPlayer = $SFXPew
@onready var hud_object : HUD = $"../HUD"

func _ready() -> void:
	hud_object.update_throws_label(_throws_left)
	hud_object.update_hand_label(true)


func _process(_delta: float) -> void:
	if (_is_thrown): if (_tomato_object.get_is_landed()): 
		_is_thrown = false
		_throws_left -= 1
		hud_object.update_throws_label(_throws_left)
		if (_throws_left > 0):
			hud_object.update_hand_label(true)
		else:
			game_finished.emit()

	
func throw() -> void:
	if (_throws_left > 0 && !_is_thrown):
		sound_shoot.play()
		_tomato_object = load("res://Tomato.tscn").instantiate()
		get_parent().add_child(_tomato_object)
		_tomato_object.global_position = global_position
		_tomato_object.apply_impulse(Vector2(throw_strength,throw_ydirection * 5), Vector2(1,throw_ydirection).normalized())
		_is_thrown = true
		hud_object.update_hand_label(false)
		
		
func addy() -> void:
	if (throw_ydirection < 90):
		throw_ydirection += 10


func subtracty() -> void:
	if (throw_ydirection > -90):
		throw_ydirection -= 10
		
		
func add_strength() -> void:
	throw_strength += 20
	
	
func subtract_strength() -> void:
	if (throw_strength > 0):
		throw_strength -= 20
