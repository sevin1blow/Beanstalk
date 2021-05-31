extends Position2D

var y = 0
var platform = preload("res://World/Leaf.tscn")

signal create_leaf

func _ready():
	randomize()
	var ha_width = get_viewport_rect().size.x
	while y > rand_range(-1500, -2000):
		var new_platform = platform.instance()
		new_platform.position = Vector2(rand_range(-ha_width/4, ha_width/4),y)
		add_child(new_platform)
		y -= rand_range(30, 50)
		emit_signal("create_leaf")


func _on_Leaf_generator_create_leaf():
	pass
