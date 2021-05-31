extends Node2D

func _on_PlayButton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://World/World.tscn")

func _on_CreditsButton_pressed():
	get_tree().change_scene("res://Credits.tscn")
