extends CharacterBody2D

var speed = 100

func _physics_process(delta):
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = direction * speed
	print(direction)
	
	move_and_slide()
