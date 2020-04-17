extends KinematicBody2D
class_name pushable

# warning-ignore:unused_argument
func _physics_process(delta):
	var velocity = Vector2(0, 200)
# warning-ignore:return_value_discarded
	move_and_slide(velocity, Vector2(0, -1))

# warning-ignore:unused_argument
func push(velocity : Vector2) -> void:
	print("Push not implemented")

