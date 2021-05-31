extends Camera2D

onready var player = $"../Player"

func _physics_process(_delta):
	var play_pos = player.position
	if play_pos.y < position.y:
		position = Vector2(0,play_pos.y)
