extends CharacterBody2D

#extends "res://entity_base.gd"

@export var FEATHER: PackedScene = preload("res://scenes/resources/attacks/playerattacks/OwlFeather.tscn")

@onready var player = $Sprite2D
@onready var featherattack = $OwlFeather/feathersprite
var floor_friction = 17.5
var air_friction = 2.4
var ice_friction = 0.5
var speed = 100
var max_speed: int = 180
var max_run_speed: int = 150
var accel = 2
var canJump
var jump_force = 320
var dJump
var dJump_force = 270
var canAttack
var gravity = 20


var jVelo = 0.32
var dVelo = 1


func _process(_delta):
	velocity.y += gravity




var state = "GROUND"

func state_machine():
	match state:
		"GROUND":
			canJump = true
			print("on ground")
			if !is_on_floor:
				state = "AIR"
		"AIR":
			print("in air")
			if Input.is_action_just_pressed("UP"):
				double()
				dJump = false
			if is_on_floor:
				state = "GROUND"
		
	
	pass

func _physics_process(_delta):
#	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
#	if x_input != 0:
#		sprite.scale.x = x_input
#	if x_input != 0 and !Input.is_action_pressed("ui_shift"):
#		velocity.x += x_input * accel * delta
#		velocity.x = clamp(velocity.x, -max_speed, max_speed)
#		direction = Vector2(1,0)
#		max_speed = 180
#	elif x_input != 0 and Input.is_action_pressed("ui_shift"):
#		$AnimationPlayer.play("owlrun")
#		velocity.x += x_input * accel * delta
#		velocity.x = clamp(velocity.x, -max_run_speed, max_run_speed)
#		direction = Vector2(1,0)
	if is_on_floor():
		canJump = true
		$AnimationPlayer.play("owlstand")
		if Input.is_action_just_pressed("ui_up"):
			velocity.y -= jump_force
#			direction = Vector2(0,-1)
		if Input.is_action_pressed("ui_down"):
			max_speed = 0
			floor_friction = 100
			$AnimationPlayer.play("owlkneel")
		if Input.is_action_pressed("ui_left"):
			velocity.x -= speed
			print("going left")
		if Input.is_action_pressed("ui_right"):
			velocity.x += speed
			print("going right")
	if !is_on_floor() and canJump:
		if velocity.y <= 1:
			$AnimationPlayerAir.play("owljump")
			canJump = false
	if velocity.y >= 1:
		$AnimationPlayerAir.play("owlfall")
	if !is_on_floor() and Input.is_action_just_pressed("ui_up") and dJump:
		velocity.y = 0
		velocity.y -= dJump_force
#		direction = Vector2(0,-1)
		dJump = false
		dJump_force = 0
		$AnimationPlayerAir.play("owldouble")
	if is_on_floor() and !dJump:
		dJump = true
		dJump_force = 270
#	if !x_input and is_on_floor():
#		velocity.x = lerp(velocity.x, 0.0, floor_friction * delta)
#	if !x_input and !is_on_floor():
#		velocity.x = lerp(velocity.x, 0.0, air_friction * delta)


func double():
	pass
	
	
func shoot_feather(feather_direction: Vector2):
	featherattack = false
	if Input.is_action_just_pressed("action_attack"):
		shoot_feather(feather_direction)
		featherattack = true
		#$OwlFeather.visible = true
	
	if FEATHER:
		var feather = FEATHER.instantiate() #Consider getting rid of "var feather ="
		get_tree().current_position = self.global_position #This could be where you could define where the attack spawns
		#$feathersprite.scale.x = x_input #Using this might mean the feather's sprite turns with the player even after shooting
		
		
func _on_player_died():
	print("Player died")
