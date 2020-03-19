extends Node2D

var currentScene

export(String, FILE, "*.tscn") var world_Scene

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		Transition.fade_to(world_Scene)
