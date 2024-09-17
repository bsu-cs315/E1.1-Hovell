class_name Level
extends Node2D

@onready var _hand_object : Hand = $Hand
@onready var _hud_object : HUD = $HUD
@onready var _arrow_sprite : Sprite2D = $Arrow

func _ready() -> void:
	_hud_object.update_strength_label(_hand_object.throw_strength)


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("throw"):
		_hand_object.throw()

	if Input.is_action_just_pressed("addStrength"):
		_hand_object.add_strength()
		_hud_object.update_strength_label(_hand_object.throw_strength)
		
	if Input.is_action_just_pressed("subtractStrength"):
		_hand_object.subtract_strength()
		_hud_object.update_strength_label(_hand_object.throw_strength)
		
	if Input.is_action_just_pressed("addY"):
		_hand_object.addy()
		if _hand_object.throw_ydirection < 90:
			_arrow_sprite.rotation_degrees += 10
		
	if Input.is_action_just_pressed("subtractY"):
		_hand_object.subtracty()
		if _hand_object.throw_ydirection > -90:
			_arrow_sprite.rotation_degrees -= 10
		
		
func _on_hand_game_finished() -> void:
	get_tree().change_scene_to_file("res://title.tscn")
