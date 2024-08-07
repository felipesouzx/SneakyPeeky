extends CharacterBody2D


const speed = 50

@onready var waypoint: Vector2 = $Marker2D.global_position
@onready var first_position: Vector2 = global_position
@onready var direction = waypoint - first_position

func _ready():
	pass
	
func _physics_process(delta):
	var current_position: Vector2 = global_position
	
	if  global_position.distance_to(waypoint) < 5:
		direction = Vector2.ZERO
		
	print(current_position)
	velocity = direction * speed * delta
	
	move_and_slide()
