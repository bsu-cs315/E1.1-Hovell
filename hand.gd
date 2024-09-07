class_name Hand extends Node2D

@onready var sfxPew : AudioStreamPlayer = $SFXPew
@onready var hudObject : HUD = $"../HUD"

var throwStrength : float = 500
var throwYDirection : float = 0
var tomatoObject : Tomato
var isThrown : bool = false
var throwsLeft : int = 3

func _ready() -> void:
	hudObject.updateThrowsLeft(throwsLeft)
	hudObject.updateHandAvailable(true)

func _process(_delta: float) -> void:
	if (isThrown): if (tomatoObject.getIsLanded()): 
		isThrown = false
		throwsLeft -= 1
		hudObject.updateThrowsLeft(throwsLeft)
		if (throwsLeft > 0):
			hudObject.updateHandAvailable(true)
		else:
			hudObject.handFinished()
	
func throw() -> void:
	if (throwsLeft > 0 && !isThrown):
		sfxPew.play()
		tomatoObject = load("res://Tomato.tscn").instantiate()
		get_parent().add_child(tomatoObject)
		tomatoObject.global_position = global_position
		tomatoObject.apply_impulse(Vector2(throwStrength,throwYDirection * 5), Vector2(1,throwYDirection).normalized())
		isThrown = true
		hudObject.updateHandAvailable(false)
		
func addY() -> void:
	if (throwYDirection < 90):
		throwYDirection += 10

func subtractY() -> void:
	if (throwYDirection > -90):
		throwYDirection -= 10
		
func addStrength() -> void:
	throwStrength += 20
	
func subtractStrength() -> void:
	if (throwStrength > 0):
		throwStrength -= 20
