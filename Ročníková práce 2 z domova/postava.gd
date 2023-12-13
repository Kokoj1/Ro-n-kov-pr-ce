extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 0

@onready var _animation_player = $AnimationPlayer
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var mov_direction = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		mov_direction += Vector2.DOWN
		_animation_player.stop()
	if Input.is_action_pressed("ui_left"):
		mov_direction += Vector2.LEFT
		_animation_player.stop()
	if Input.is_action_pressed("ui_right"):
		mov_direction += Vector2.RIGHT
		_animation_player.stop()
	if Input.is_action_pressed("ui_up"):
		mov_direction += Vector2.UP	
		_animation_player.stop()
	else:
		_animation_player.play("idle")
		
	velocity = mov_direction * SPEED
	var mouse_position = get_global_mouse_position()
	if mouse_position.x > global_position.x:
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false
	move_and_slide()
	
			
	
