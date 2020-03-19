extends Node2D

var currentScene

export(String, FILE, "*.tscn") var world_Scene

func _ready():
	currentScene = get_tree().current_scene.name
	print(currentScene)

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene(world_Scene)
