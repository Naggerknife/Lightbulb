extends KinematicBody2D

var maxSpeed = 200
var accelerationSpeed = 50
var movement = Vector2()
var jumpForce = -400

const UP = Vector2(0, -1)

var isPushing = false

onready var ground_cast = $RayCast2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	movement.y += 20
	
	if Input.is_action_pressed("moveRight"):
		movement.x = min(movement.x + accelerationSpeed, maxSpeed)
		$AnimatedSprite.flip_h = false
		if !isPushing:
			$AnimatedSprite.play("Walk")
	elif Input.is_action_pressed("moveLeft"):
		movement.x = max(movement.x - accelerationSpeed, -maxSpeed)
		$AnimatedSprite.flip_h = true
		if !isPushing:
			$AnimatedSprite.play("Walk")
	else:
		movement.x = lerp(movement.x, 0, 0.3)
		if !isPushing:
			$AnimatedSprite.play("Idle")
		
	if ground_cast.is_colliding():
		if Input.is_action_pressed("jump"):
			movement.y = jumpForce
		
	
	movement = move_and_slide(movement, UP, false, 4, PI/4, false)
	
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("Pushable"):
			$AnimatedSprite.stop()
			$AnimatedSprite.play("Push")
			collision.collider.apply_central_impulse(-collision.normal * 4)
