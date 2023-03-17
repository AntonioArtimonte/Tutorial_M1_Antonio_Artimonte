extends KinematicBody2D

# variables

var velocity = Vector2()

var current_state := 2
enum { WALK, JUMP, IDLE, FALL }

var enter_state := true

# physics_process function

func _physics_process(delta):
	match current_state:
		WALK:
			_walk_state(delta)
		JUMP:
			_jump_state(delta)
		IDLE:
			_idle_state(delta)
		FALL:
			_fall_state(delta)

# state functions

func _fall_state(_delta): # falling function
	$AnimatedSprite.play("idle")
	_apply_gravity(_delta)
	_move()
	_move_and_slide()
	_set_state(_check_fall_state())

func _jump_state(_delta): # jumping function
	if enter_state:
		$AnimatedSprite.play("jump")
		velocity.y = -300
		enter_state = false
	_apply_gravity(_delta)
	_move()
	_move_and_slide()
	_set_state(_check_jump_state())

func _walk_state(_delta): # walking function
	$AnimatedSprite.play("walk")
	_move()
	_apply_gravity(_delta)
	_move_and_slide()
	_set_state(_check_walk_state())

func _idle_state(_delta): # idle function
	$AnimatedSprite.play("idle")
	_apply_gravity(_delta)
	velocity.x = 0 
	_move_and_slide()
	_set_state(_check_idle_state())

# check functions

func _check_idle_state(): # check if player is idle
	var new_state = current_state
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		new_state = WALK
	elif Input.is_action_just_pressed("ui_up"):
		new_state = JUMP
	elif not is_on_floor():
		new_state = FALL
	return new_state

func _check_walk_state(): # check if player is walking
	var new_state = current_state
	if (not Input.is_action_pressed("ui_left")) and (not Input.is_action_pressed("ui_right")):
		new_state = IDLE
	elif Input.is_action_just_pressed("ui_up"):
		new_state = JUMP
	elif not is_on_floor():
		new_state = FALL
	return new_state

func _check_jump_state(): # check if player is jumping
	var new_state = current_state
	if velocity.y >= 0:
		new_state = FALL
	return new_state

func _check_fall_state(): # check if player is falling
	var new_state = current_state
	if is_on_floor():
		new_state = IDLE
	return new_state

# helpers
func _apply_gravity(_delta): # function to apply gravity
	velocity.y += 800 * _delta

func _move_and_slide(): # function to use move_and_slide
	velocity = move_and_slide(velocity, Vector2.UP)

func _move(): # function to move Player
	if Input.is_action_pressed("ui_left"):
		velocity.x = -120
		$AnimatedSprite.flip_h = true
	if Input.is_action_pressed("ui_right"):
		velocity.x = 120
		$AnimatedSprite.flip_h = false

func _set_state(new_state): # function to change state on state machine
	if new_state != current_state:
		enter_state = true
	current_state = new_state


# other functions

func _get_coin(): # function to add a coin
	Global.coins += 1
