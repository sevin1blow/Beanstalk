extends Position2D

var goose = preload("res://Goose.tscn")
var random = randomize()

onready var playa = get_node("../Player")

signal create_goose(goose, location)

func _on_Timer_timeout():
	emit_signal("create_goose", goose, rand_vec(playa.position, 100))
	#Vector2(rand_range(pos.x-200,pos.x+200), rand_range(pos.y-200,pos.y+200)))	

func rand_vec(pos, max_mag):
	return pos + Vector2(-200, -200) + Vector2.UP.rotated(rand_range(0, TAU)) * rand_range(0, max_mag)
