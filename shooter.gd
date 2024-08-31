extends RigidBody2D

var strength : float = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("launch"):
		var direction = Vector2(1, -1).normalized()
		var velocity = direction * strength
		apply_impulse(Vector2(50,0), velocity)
