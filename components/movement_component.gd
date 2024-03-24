class_name MovementComponent
extends Node2D

#this script needs to facilitate movement for both Active-type enemies and the player characters.

var moveSpeed : float
@export var charBody : CharacterBody2D


func _ready():
	pass

func movement_handler(charBody, dir : float, delta : float) -> void:
	charBody.set_velocity(charBody.velocity)
	charBody.velocity.x = dir
	charBody.move_and_slide()

func velocity_handler(charBody, dir : float, delta : float) -> void:
	if dir < 0:
		charBody.velocity.x = -moveSpeed * delta
	if dir > 0:
		charBody.velocity.x = moveSpeed * delta


