extends Sprite2D

var can_fire = true
var bullet = preload("res://area_2d.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_top_level(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x = lerp(position.x, get_parent().position.x, 1)
	position.y = lerp(position.y, get_parent().position.y, 1)
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
	var direction = (mouse_pos - global_position).normalized()
	if direction.x > 0:
		scale.y = abs(scale.y)
	elif direction.x < 0:
		scale.y = -abs(scale.y) 

	if Input.is_action_pressed("fire") and can_fire:
		var bullet_instance = bullet.instantiate()
		bullet_instance.rotation = rotation
		bullet_instance.global_position =  $Marker2D.get_global_transform().origin
		get_parent().add_child(bullet_instance)
		can_fire = false
		await get_tree().create_timer(0.2).timeout
		can_fire = true
