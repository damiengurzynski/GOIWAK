extends KinematicBody2D

var velocity=Vector2.ZERO
var rightclick=false
export var onright=false

func _physics_process(delta):
	if Input.is_action_just_pressed("rightclick"):
		get_parent().get_node("leftHand").onleft=false
		rightclick=true
		onright=true
	if Input.is_action_just_released("rightclick"): rightclick=false
	
	#if onright: Input.warp_mouse_position(self.global_position)
	
	if rightclick:
		velocity=Vector2.ZERO
		self.global_position=get_viewport().get_mouse_position()
	
	move_and_slide(velocity,Vector2(0,-1))
	
	if is_on_floor(): velocity=Vector2.ZERO
	else: velocity.y+=6
