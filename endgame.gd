extends Control

var final_score = 0

func _physics_process(delta):
	score()

func _on_ResetButton_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible
	get_tree().reload_current_scene()

func _on_MenuButton_pressed():
	get_tree().change_scene("res://MainMenu.tscn")

func score():
	get_node("CenterContainer/VBoxContainer/Label2").text = "score:" + str(final_score)
