class_name enemy
extends CharacterBody2D

@export var wanderDir : Node2D


const moveSpeed = 300.0
const JUMP_VELOCITY = -400.0

@onready var voreTimer = $VoreTimer

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if is_on_floor():
		velocity.y -= 200
		voreTimer.start()
	velocity = wanderDir.direction * moveSpeed
	move_and_slide()


func _on_vore_timer_timeout():
	velocity.y += 200

