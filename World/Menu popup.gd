extends Control

func _input(event):
	if event.is_action_pressed("menu"):
		get_tree().paused = not get_tree().paused
		visible = not visible

func _on_ResumeButton_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible


func _on_RestartButton_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible
	get_tree().reload_current_scene()


func _on_MenuButton_pressed():
	get_tree().change_scene("res://MainMenu.tscn")
