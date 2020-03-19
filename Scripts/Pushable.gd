extends KinematicBody2D
class_name pushable

func _physics_process(delta):
	var velocity = Vector2(0, 200)
	move_and_slide(velocity, Vector2(0, -1))

func push(velocity : Vector2) -> void:
	print("Push not implemented")

