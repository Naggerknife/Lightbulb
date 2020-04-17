extends CanvasLayer


var scene_path = ""

func fade_to(scn_path):
	scene_path = scn_path
	$AnimationPlayer.play("Fade")
	
func change_scene() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene(scene_path)
