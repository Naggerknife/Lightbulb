extends Node2D

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		Transition.fade_to(str("res://" + get_tree().current_scene.name + ".tscn"))
