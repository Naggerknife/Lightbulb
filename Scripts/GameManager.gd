extends Node2D

onready var player = $Player

func _ready():
	pass # Replace with function body.

# warning-ignore:unused_argument
func _process(delta):
	if player.get_node("Light2D").texture_scale <= 0:
		Transition.fade_to(str("res://" + get_tree().current_scene.name + ".tscn"))
