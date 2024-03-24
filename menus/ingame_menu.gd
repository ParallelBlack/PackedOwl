extends CanvasLayer

func _process(_delta):
	if !$ingame_menu.visible and Input.is_action_just_pressed("ui_pause"):
		$ingame_menu.visible = true
	elif $ingame_menu.visible and Input.is_action_just_pressed("ui_pause"):
		$ingame_menu.visible = false

func _on_Menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/Mainmenu.tscn")

func _on_Next_pressed():
	get_tree().change_scene_to_file("res://scenes/testroom.tscn")

#func _on_Exit_pressed():
#	get_tree().notification(MainLoop.)
