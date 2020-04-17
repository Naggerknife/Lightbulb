extends Node2D

signal body_entered


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.find_node("Light2D").set("isRecharging", true)

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		body.find_node("Light2D").set("isRecharging", false)
