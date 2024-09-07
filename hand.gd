class_name Hand extends Node2D

@onready var sfxPew : AudioStreamPlayer = $SFXPew
@onready var hudObject : HUD = $"../HUD"

var strength : float = 100
var yDirection : float = 0
var isLanded : bool = false
var ball : Shooter
var isShot : bool = false
var shotsLeft : int = 3

func _ready() -> void:
	hudObject.updateShotsLeft(shotsLeft)

func _process(_delta: float) -> void:
	if (isShot): if (ball.getIsLanded()): 
		isShot = false
		shotsLeft -= 1
		hudObject.updateShotsLeft(shotsLeft)
	
	
func launch() -> void:
	if (shotsLeft > 0 && !isShot):
		sfxPew.play()
		ball = load("res://shooter.tscn").instantiate()
		get_parent().add_child(ball)
		ball.global_position = global_position
		ball.apply_impulse(Vector2(strength,yDirection * 5), Vector2(1,yDirection).normalized())
		isShot = true
		
func addY() -> void:
	if (yDirection < 90):
		yDirection += 10

func subtractY() -> void:
	if (yDirection > -90):
		yDirection -= 10
		
func addStrength() -> void:
	strength += 20
	
func subtractStrength() -> void:
	if (strength > 0):
		strength -= 20
