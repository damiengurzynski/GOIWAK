extends KinematicBody2D

var velocity=Vector2.ZERO
var leftclick=false
export var onleft=false

func _physics_process(delta):
	if Input.is_action_just_pressed("leftclick"):
		get_parent().get_node("rightHand").onright=false
		leftclick=true
		onleft=true
	if Input.is_action_just_released("leftclick"): leftclick=false
	
	#if onleft: Input.warp_mouse_position(self.global_position)
	
	if leftclick:
		velocity=Vector2.ZERO
		self.global_position=get_viewport().get_mouse_position()
	
	move_and_slide(velocity,Vector2(0,-1))
	
	if is_on_floor(): velocity=Vector2.ZERO
	else: velocity.y+=6
