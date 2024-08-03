extends CharacterBody2D

var speed = 400

func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		velocity.y =  - speed
