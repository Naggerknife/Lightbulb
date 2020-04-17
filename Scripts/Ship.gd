extends pushable

func push(velocity : Vector2) -> void:
# warning-ignore:return_value_discarded
	move_and_slide(velocity, Vector2())
