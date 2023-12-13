extends CharacterBody2D

var speed = 200
var player_chase = false
var player = null

func _physics_process(delta):
	if player_chase:
		
		position += (player.position - position)/speed

func _on_area_2d_body_entered(body):
	if body.name == 'player':
		player = body
		player_chase = true


func _on_area_2d_body_exited(body):
	if body.name == 'player':
		player = null
		player_chase = false
