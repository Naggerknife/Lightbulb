extends Node2D

signal body_entered


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		emit_signal("body_entered")
	pass # Replace with function body.
