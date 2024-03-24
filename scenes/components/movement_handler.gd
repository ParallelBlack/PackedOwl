class_name MovementHandler
extends Node2D


@export_category("Jumping")
@export var jHeight : float = 92
@export var jPeak : float = 0.28
@export var jTime : float = 0.28

@onready var jVelo: float = ((1.5 * jHeight) / jPeak) * -1
@onready var dVelo: float = ((2.75 * jHeight) / jPeak) * -1 #This tall double jump is designed for Owen
@onready var jGrav: float = ((-2 * jHeight) / (jPeak * jPeak)) * -1
@onready var fGrav: float = ((-2 * jHeight) / (jTime * jTime)) * -1

@export var moveSpeed : int = 0
@export var gravDown : float = 0
@export var gravUp : float = 0

var charBody = CharacterBody2D

func _ready():
	pass

func handle_movement(charBody, input_dir : float, delta : float) -> void:
	handle_decel(charBody, delta)
	handle_gravity(charBody, delta)
	if input_dir < 0:
		charBody.velocity.x = -moveSpeed# * delta
	if input_dir > 0:
		charBody.velocity.x = moveSpeed# * delta


func handle_movement_input(moveSpeed):
	pass


func handle_decel(charBody, delta : float):
	charBody.velocity.x = 0


func handle_gravity(charBody, delta : float):
	if !charBody.is_on_floor():
		if charBody.velocity.y < 0:
			charBody.velocity.y += gravUp# * delta
		if charBody.velocity.y > 0:
			charBody.velocity.y += gravDown
