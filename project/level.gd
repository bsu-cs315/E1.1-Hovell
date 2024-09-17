class_name Level
extends Node2D

signal tomato_thrown

@onready var _hand_object : Hand = $Hand
@onready var _hud_object : HUD = $HUD
@onready var _arrow_sprite : Sprite2D = $Arrow

func _ready() -> void:
	_hud_object.update_strength_label(_hand_object.throw_strength)
	_hud_object.update_hand_label(true)
	_hud_object.update_throws_label(_hand_object.throws_left)


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("throw"):
		tomato_thrown.emit()
		_hud_object.update_hand_label(false)

	if Input.is_action_just_pressed("addStrength"):
		_hand_object.add_strength()
		_hud_object.update_strength_label(_hand_object.throw_strength)
		
	if Input.is_action_just_pressed("subtractStrength"):
		_hand_object.subtract_strength()
		_hud_object.update_strength_label(_hand_object.throw_strength)
		
	if Input.is_action_just_pressed("addY"):
		_hand_object.addy()
		if _hand_object.throw_ydirection < _hand_object.max_throw_angle:
			_arrow_sprite.rotation_degrees += _hand_object.ydirection_increment
		
	if Input.is_action_just_pressed("subtractY"):
		_hand_object.subtracty()
		if _hand_object.throw_ydirection > _hand_object.min_throw_angle:
			_arrow_sprite.rotation_degrees -= _hand_object.ydirection_increment
		
		
func _on_hand_game_finished() -> void:
	get_tree().change_scene_to_file("res://title.tscn")


func _on_hand_throw_finished() -> void:
	_hud_object.update_throws_label(_hand_object.throws_left)
	_hud_object.update_hand_label(true)
