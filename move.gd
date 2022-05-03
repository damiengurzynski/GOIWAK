extends KinematicBody2D

var gravity=30
var speed = 300
var friction = 0.1
var acceleration = 0.1
var velocity = Vector2.ZERO
var handradius=150

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func Move():
	var input_velocity = Vector2.ZERO
	if Input.is_action_pressed("moveright"):
		input_velocity.x += 1
	if Input.is_action_pressed("moveleft"):
		input_velocity.x -= 1
	if Input.is_action_pressed("movedown"):
		input_velocity.y += 1
	if Input.is_action_pressed("moveup"):
		input_velocity.y -= 1
	input_velocity = input_velocity.normalized() * speed
	
	velocity.y+=gravity
	
	if input_velocity.length() > 0:
		velocity = velocity.linear_interpolate(input_velocity, acceleration)
	else:
		velocity = velocity.linear_interpolate(Vector2.ZERO, friction)
	velocity = move_and_slide(velocity)

func Mouse():
	var localpos=self.get_local_mouse_position()
	if localpos.length()>handradius: Input.warp_mouse_position(to_global(localpos.normalized()*handradius))
	
func _physics_process(delta):
	Move()
	Mouse()
