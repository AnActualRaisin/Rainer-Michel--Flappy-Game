extends CharacterBody2D

const GRAVITY : int = 2000
const MAX_VEL : int = 700
const FLAP_SPEED : int = -700
var flying : bool = false
var falling : bool = false
const START_POS = Vector2(100, 400)

func _ready():
	reset()

func reset():
	falling = false
	flying = false
	position = START_POS
	set_rotation(0)
	
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if flying or falling:
		velocity.y += GRAVITY * delta
		#terminal velocity
		if velocity.y > MAX_VEL:
			velocity.y = MAX_VEL
		if flying:
			set_rotation(deg_to_rad(velocity.y * 0.05))
			$AnimatedSprite2D.play()
		elif falling:
			set_rotation(PI/2)
			$AnimatedSprite2D.stop()
		move_and_collide(velocity * delta)
	else:
		$AnimatedSprite2D.stop()
		
func flap():
	velocity.y = FLAP_SPEED
