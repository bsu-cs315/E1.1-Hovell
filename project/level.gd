class_name Level extends Node2D

@onready var handObject : Hand = $Hand
@onready var hudObject : HUD = $HUD
@onready var arrowSprite : Sprite2D = $Arrow



func _ready() -> void:
	hudObject.updateStrength(handObject.throwStrength)

func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("throw")):
		handObject.throw()

	if (Input.is_action_just_pressed("addStrength")):
		handObject.addStrength()
		hudObject.updateStrength(handObject.throwStrength)
		
	if (Input.is_action_just_pressed("subtractStrength")):
		handObject.subtractStrength()
		hudObject.updateStrength(handObject.throwStrength)
		
	if (Input.is_action_just_pressed("addY")):
		handObject.addY()
		if (handObject.throwYDirection < 90): arrowSprite.rotation_degrees += 10
		
	if (Input.is_action_just_pressed("subtractY")):
		handObject.subtractY()
		if (handObject.throwYDirection > -90): arrowSprite.rotation_degrees -= 10
		
func _on_hand_game_finished() -> void:
	get_tree().change_scene_to_file("res://title.tscn")
