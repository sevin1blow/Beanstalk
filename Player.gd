extends KinematicBody2D

const MOVE_SPEED = 100
const JUMP_SPEED = 200
const GRAVITY = 5
const MAX_FALL_SPEED = 500
const DEATH_SPIN = 3 #rotations per second

var camera_pos
var y_velo = 0
var flying = false
var dying = false
var eggs = 0

onready var height = get_viewport_rect().size


func _physics_process(delta):
	var move_dir = 0
	if Input.is_action_pressed("right"):
		move_dir += 1
	if Input.is_action_pressed("left"):
		move_dir -= 1
# warning-ignore:return_value_discarded
	move_and_slide(Vector2(move_dir * MOVE_SPEED, y_velo), Vector2(0, -1))
	fly()
	
	y_velo += GRAVITY
	if y_velo > MAX_FALL_SPEED:
		y_velo = MAX_FALL_SPEED
	
	if dying:
		rotate(TAU*delta*DEATH_SPIN)

func bounce():
	if y_velo > 0:
		y_velo = 0
		y_velo -= JUMP_SPEED

func fly_time():
		flying = true
		$Timer.start()

func fly():
	if flying == true:
		y_velo = -100

func _on_Timer_timeout():
	flying = false

func fall():
	if flying == true:
		flying = false
	else:
		dying = true
		set_collision_mask_bit(1, false)
		set_collision_mask_bit(2,false)

func egg_count():
	eggs += 1
	get_node("../Camera2D/EggCounter/Label").text = str(eggs)

func _on_VisibilityNotifier2D_screen_exited():
	camera_pos = get_node("../Camera2D").position
	if position.y > camera_pos.y + height.y/2:
		get_node("../CanvasLayer/endgame").visible = true
		get_tree().paused = true
