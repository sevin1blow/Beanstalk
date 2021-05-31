extends Area2D

var dead = false
var camera_pos

func die():
	randomize()
	var random = rand_range(0,1)
	print (random)
	if random < 0.5:
		dead = true
		$Sprite.frame = 1

func _on_Leaf_body_entered(body):
	if dead == false:
		body.bounce()
	else:
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	camera_pos = get_node("../Camera2D").position
	if position.y + 100 > camera_pos.y:
		queue_free()
