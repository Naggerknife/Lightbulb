extends MarginContainer

func _on_Play_pressed():
	Transition.fade_to("res://Level1.tscn")
	#get_tree().change_scene("res://Level1.tscn")
	pass


func _on_Quit_pressed():
	print("Quit Pressed")
	pass # Replace with function body.
