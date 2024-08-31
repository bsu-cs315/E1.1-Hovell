extends RigidBody2D

var strength : float = 20
var yDirection : float = 0
var isShot : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gravity_scale = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("launch") && !isShot:
		var direction = Vector2(1, yDirection).normalized()
		var velocity = direction * strength
		apply_impulse(Vector2(50,yDirection), velocity)
		gravity_scale = 0.1
		isShot = true
		
	if Input.is_action_just_pressed("addY") && yDirection < 90 && !isShot:
		yDirection += 10
		$"../Arrow".rotation_degrees += 10
		
	if Input.is_action_just_pressed("subtractY") && yDirection > -90 && !isShot:
		yDirection -= 10
		$"../Arrow".rotation_degrees -= 10
	
