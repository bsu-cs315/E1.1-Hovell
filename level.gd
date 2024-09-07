class_name Level extends Node2D

@onready var handObject : Hand = $Hand
@onready var hudObject : HUD = $HUD
@onready var arrowSprite : Sprite2D = $Arrow



func _ready() -> void:
	hudObject.updateStrength(handObject.strength)

func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("launch")):
		handObject.launch()

	if (Input.is_action_just_pressed("addStrength")):
		handObject.addStrength()
		hudObject.updateStrength(handObject.strength)
		
	if (Input.is_action_just_pressed("subtractStrength")):
		handObject.subtractStrength()
		hudObject.updateStrength(handObject.strength)
		
	if (Input.is_action_just_pressed("addY")):
		handObject.addY()
		if (handObject.yDirection < 90): arrowSprite.rotation_degrees += 10
		
	if (Input.is_action_just_pressed("subtractY")):
		handObject.subtractY()
		if (handObject.yDirection > -90): arrowSprite.rotation_degrees -= 10
		
