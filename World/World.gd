extends Node2D

var platform = preload("res://World/Leaf.tscn")
#var width = get_viewport().get_visible_rect().size.x
var y = 10

func _ready():
	randomize()
	var ha_width = get_viewport_rect().size.x
	while y > -3000:
		var new_platform = platform.instance()
		new_platform.position = Vector2(rand_range(-ha_width/5, ha_width/5),y)
		add_child(new_platform)
		y -= 50

func _on_Goose_Maker_create_goose(goose, location):
	var goose_instance = goose.instance()
	add_child(goose_instance)
	goose_instance.global_position = location
