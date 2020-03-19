extends Node2D

onready var player = $Player

func _ready():
	pass # Replace with function body.

func _process(delta):
	if player.get_node("Light2D").texture_scale <= 0:
		get_tree().reload_current_scene()
