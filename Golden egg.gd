extends Sprite

var y_velo = 0

func _ready():
	y_velo = 120

func _physics_process(delta):
	global_position.y += y_velo * delta

func _on_Area2D_body_entered(body):
	if y_velo > 0:
		body.fall()
	else:
		body.egg_count()
		queue_free()


func _on_Area2D_area_entered(area):
	y_velo = 0
