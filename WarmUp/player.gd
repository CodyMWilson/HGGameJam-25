extends CharacterBody2D

var movespeed = 500
var is_moving = false

func _physics_process(delta: float) -> void:
	var motion = Vector2()
	
	if Input.is_action_pressed("up") and !is_moving:
		is_moving = true
		motion.y -= 1
		velocity = motion.normalized() * movespeed
		$AnimatedSprite2D.play("up")
	elif Input.is_action_pressed("down") and !is_moving:
		is_moving = true
		motion.y += 1
		velocity = motion.normalized() * movespeed
		$AnimatedSprite2D.play("down")
	elif Input.is_action_pressed("left") and !is_moving:
		is_moving = true
		motion.x -= 1
		velocity = motion.normalized() * movespeed
		$AnimatedSprite2D.play("left")
	elif Input.is_action_pressed("right") and !is_moving:
		is_moving = true
		motion.x += 1
		velocity = motion.normalized() * movespeed
		$AnimatedSprite2D.play("right")
	
		
	move_and_slide()
	
func stop_moving():
	is_moving = false
	velocity = Vector2(0,0)


func _on_area_2d_body_entered(body: Node2D) -> void:
	stop_moving()
