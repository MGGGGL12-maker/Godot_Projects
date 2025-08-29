extends CharacterBody2D


const SPEED = 170.0
const JUMP_VELOCITY = -350.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	Move()
	Jump(delta)


func Move():
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Move_Left", "Move_Right")
	if direction:
		if direction < 0:
			animated_sprite_2d.flip_h = true
		elif direction > 0:
			animated_sprite_2d.flip_h = false
		velocity.x = direction * SPEED
		animated_sprite_2d.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite_2d.play("Idle")

	move_and_slide()


func Jump(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated_sprite_2d.play("Jump")

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
