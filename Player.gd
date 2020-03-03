extends KinematicBody2D

var movementSpeed = 200
var movement = Vector2()
var jumpForce = -400

const UP = Vector2(0, -1)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	movement.y += 20
	
	if Input.is_action_pressed("moveRight"):
		movement.x = movementSpeed

	elif Input.is_action_pressed("moveLeft"):
		movement.x = -movementSpeed
		
	else:
		movement.x = 0
		
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			movement.y = jumpForce
		
		
	
	movement = move_and_slide(movement, UP)
