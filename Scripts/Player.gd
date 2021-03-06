extends KinematicBody2D

var move_speed = 200
var jumpForce = -300

var motion := Vector2()
var pushMotion := Vector2()

const UP = Vector2(0, -1)

var isPushing = false

func _ready():
	$RayCast2D.enabled = true

# warning-ignore:unused_argument
func _physics_process(delta):
	if Input.is_action_pressed("moveRight"):
		motion.x = move_speed
		if !isPushing && is_on_floor():
			$AnimatedSprite.play("Walk")
		$AnimatedSprite.flip_h = false
		$RayCast2D.rotation_degrees = -90
	elif Input.is_action_pressed("moveLeft"):
		if !isPushing && is_on_floor():
			$AnimatedSprite.play("Walk")
		$AnimatedSprite.flip_h = true
		$RayCast2D.rotation_degrees = 90
		motion.x = -move_speed
	else:
		motion.x = 0
		if is_on_floor():
			$AnimatedSprite.play("Idle")
	
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			$AnimatedSprite.play("Jump")
			motion.y = jumpForce
			
	motion.y += 10
	pushMotion = motion
	motion = move_and_slide(motion,  UP)
	
	if $RayCast2D.is_colliding():
		var pushable = $RayCast2D.get_collider() as pushable
		if pushable:
			isPushing = true
			$AnimatedSprite.play("Push")
			pushable.push(pushMotion / 2)
	else:
		isPushing = false
