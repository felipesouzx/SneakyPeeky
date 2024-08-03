extends CharacterBody2D


const SPEED =200
var waypoint: Vector2
var ponto_ir: Vector2 = $Marker2D.global_position
var current_position: vector = 
func _physics_process(delta):
	while CharacterBody2D.glbal_position != pontoir:
		velocity.x -= speed


	move_and_slide()
