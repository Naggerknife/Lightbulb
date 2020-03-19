extends CanvasLayer


var scene_path = ""

func fade_to(scn_path):
	scene_path = scn_path
	$AnimationPlayer.play("Fade")
	
func change_scene() -> void:
	get_tree().change_scene(scene_path)
