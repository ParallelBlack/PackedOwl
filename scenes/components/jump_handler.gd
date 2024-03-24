class_name JumpHandler
extends Node2D

@export_category("Jumping")
@export var jHeight : float = 92
@export var jPeak : float = 0.28
@export var jTime : float = 0.28

@onready var jVelo: float = ((1.5 * jHeight) / jPeak) * -1
@onready var dVelo: float = ((2.75 * jHeight) / jPeak) * -1 #This tall double jump is designed for Owen
@onready var jGrav: float = ((-2 * jHeight) / (jPeak * jPeak)) * -1
@onready var fGrav: float = ((-2 * jHeight) / (jTime * jTime)) * -1

@export var jump_speed : float = 300
var charBody : CharacterBody2D

func handle_jump(charBody, is_jumping : bool) -> void:
	if is_jumping and charBody.is_on_floor():
		charBody.velocity.y = jVelo
	pass
