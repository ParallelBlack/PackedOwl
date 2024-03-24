extends CharacterBody2D

@onready var sprite = $Sprite2D as Sprite2D
@onready var inputHandler = $InputHandler as InputHandler
@onready var movementHandler = $MovementHandler as MovementHandler
@onready var jumpHandler = $JumpHandler as JumpHandler
@onready var flipHandler = $FlipHandler as FlipHandler


func _ready():
	pass

func _physics_process(delta):
	movementHandler.handle_movement(self, inputHandler.handle_movement_input(), delta)
	jumpHandler.handle_jump(self, inputHandler.handle_jump_input())
	flipHandler.handle_flip(self)
	state_logic()
	move_and_slide()

var state = "START"

func state_logic():
	match state:
		"START":
			velocity.y = 500
			if is_on_floor():
				state = "GO"
		"GO":
			pass
