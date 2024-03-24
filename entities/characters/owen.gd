extends CharacterBody2D


@onready var feather = preload("res://scenes/resources/attacks/playerattacks/OwlFeather.tscn")

@onready var anim = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var coyoteTimer = $CoyoteTimer
var canFallAnim: bool
var canJumpAnim: bool

var canJump : bool
var canDouble : bool = false
var fireSpeed : float = 0.5

@export_category("Movement")
@export var moveSpeed : float = 100.0
var isMoving : bool
var playerPos = self

@export_category("Jumping")
@export var jHeight : float = 92
@export var jPeak : float = 0.28
@export var jTime : float = 0.28

@onready var jVelo: float = ((1.5 * jHeight) / jPeak) * -1
@onready var dVelo: float = ((2.75 * jHeight) / jPeak) * -1 #This tall double jump is designed for Owen
@onready var jGrav: float = ((-2 * jHeight) / (jPeak * jPeak)) * -1
@onready var fGrav: float = ((-2 * jHeight) / (jTime * jTime)) * -1

@export_category("Upgrades")
@export var doubleUp : bool = false
@export var dashUp : bool = false



func _ready():
	canFallAnim = false
	pass

func _process(_delta):
#	firespeed += delta if firespeed < 0.32 else 0.32
#	dashdelay += delta if dashdelay < 2.5 else 2.5
#	print(self.position)
#	show_dialogue()
	pass





func _physics_process(_delta):
	state_handler()

	if !is_on_floor():
		velocity.y += get_grav() * _delta
	velocity.x = 0
	set_velocity(velocity)
	set_up_direction(Vector2.UP)
	velocity = velocity
	if Input.is_action_pressed("attack") and fireSpeed >= 0.32:
		attack()
		fireSpeed = 0
	if Input.is_action_pressed("move_left"):
		velocity.x -= moveSpeed
		isMoving = true
		sprite.scale.x = -1
	if Input.is_action_pressed("move_right"):
		velocity.x += moveSpeed
		isMoving = true
		sprite.scale.x = 1
	else: isMoving = false
#	if isMoving:
#		anim.play("Owenwalk")
	move_and_slide()
#flipping his sprite should be a temporary fix. He'll need new ones when he has a sword.

var state = "GROUND"

func state_handler():
	match state:
		"GROUND":
			canJump = true
			canFallAnim = false
			anim.play("Owenidle")
			if Input.is_action_just_pressed("jump"):
				jump()
			if !is_on_floor():
				coyoteTimer.start()
				canDouble = true
				state = "AIR"
		"AIR":
			canJump = false
			if velocity.y <= 0 and canJumpAnim:
				anim.play("Owenjump")
			if velocity.y >= 0 and canFallAnim:
				anim.play("Owenfall")
			if Input.is_action_just_pressed("jump") and canDouble and doubleUp:
				double()
			if is_on_floor():
				state = "GROUND"





func get_grav() -> float:
	return jGrav if velocity.y < 0 else fGrav

#func get_input_velocity(_delta) -> float:
#	var horizontal := 0.0
#	var is_left
#	if Input.is_action_pressed("ui_left"):
#		horizontal -= 1
#		sprite.scale.x = -1
#		is_left = true
#	if Input.is_action_pressed("ui_right"):
#		horizontal += 1
#		sprite.scale.x = 1
#		is_left = false
#	return horizontal

func jump():
	print("jumping!")
	velocity.y = jVelo
	canJump = false

func double():
	canDouble = false
	print("double!")
	velocity.y = 0
	velocity.y = dVelo

func attack():
	if Input.is_action_just_pressed("attack"):
		feather.instantiate()
	pass

func _on_coyote_timer_timeout():
	canFallAnim = true
	print("coyote")
	pass
