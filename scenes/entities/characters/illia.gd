extends CharacterBody2D

#@onready var inputHandle = $InputHandler as InputHandler #used with CoffeeCrow's handlers.
#@onready var moveHandle = $MovementHandler as MovementHandler

@onready var moveComp = $MovementComponent
@onready var jumpComp = $JumpComponent
@onready var sprite = $Sprite2D

var moveSpeed : float = 100
var isMoving : bool = false


func _ready():
	pass

func _physics_process(delta):
	print(velocity)
#	if !is_on_floor():
#		velocity.y += get_grav() * delta
#	velocity.x = 0
	set_velocity(velocity)
	set_up_direction(Vector2.UP)
#	velocity = velocity
	if Input.is_action_pressed("move_left"):
		moveComp.velocity_handler(moveComp.charBody, moveSpeed, delta)#velocity.x -= moveSpeed
		isMoving = true
		sprite.scale.x = -1
	if Input.is_action_pressed("move_right"):
		moveComp.velocity_handler(moveComp.charBody, moveSpeed, delta)#velocity.x += moveSpeed
		isMoving = true
		sprite.scale.x = 1
	else: isMoving = false
#	moveHandle.handle_movement(self, moveHandle.handle_movement_input(), delta)

func get_grav() -> float:
	return jumpComp.jGrav if velocity.y < 0 else jumpComp.fGrav
