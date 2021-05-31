extends Sprite

var fly_speed = 60
var up_speed = 20

var gegg = preload("res://Golden egg.tscn")

func _physics_process(delta):
	global_position += Vector2(fly_speed, -up_speed) * delta


func egg_drop():
	var gold_egg = gegg.instance()
	get_parent().add_child(gold_egg)
	gold_egg.global_position = global_position

func _on_Area2D_body_entered(body):
	if body.flying == false:
		body.fly_time()
		queue_free()
	else:
		$AnimationPlayer.play("fly_away")
		fly_speed = 120
		up_speed = 120


func _on_Timer_timeout():
	egg_drop()
