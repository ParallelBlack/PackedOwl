extends Control


func _on_play_owen_pressed():
	get_tree().change_scene_to_file("res://scenes/zones/Owenlevel.tscn")

#func _on_Exit_pressed():
#	get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)

func _on_play_illia_pressed():
	get_tree().change_scene_to_file("res://scenes/zones/illialevel.tscn")
	pass
