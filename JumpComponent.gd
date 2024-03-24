class_name JumpComponent
extends Node2D #changed from Node2D



#this script should handle gravity as well.


@export_category("Jumping")
@export var jHeight : float = 92
@export var jPeak : float = 0.28
@export var jTime : float = 0.28

@onready var jVelo: float = ((1.5 * jHeight) / jPeak) * -1
@onready var jGrav: float = ((-2 * jHeight) / (jPeak * jPeak)) * -1
@onready var fGrav: float = ((-2 * jHeight) / (jTime * jTime)) * -1

var canJump : bool
var charBody : CharacterBody2D

func _ready():
	pass

func handle_jump(dir : float, delta) -> void:
	if !charBody.is_on_floor():
		charBody.velocity.y += get_grav() * delta
		canJump = false	
	if charBody.is_on_floor():
		canJump = true

func get_grav() -> float:
	return jGrav if charBody.velocity.y < 0 else fGrav

func jump():
	charBody.velocity.y = jVelo
	pass
