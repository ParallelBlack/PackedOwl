extends CharacterBody2D

signal hp_max_changed(new_hp_max)
signal hp_changed(new_hp)
signal died

@export var hp_max: int = 100
@export var hp: int = hp_max: get = get_hp, set = set_hp
@export var defence: int = 0
@export var accel: int = 1200
@export var speed: int = 0
@export var jump_speed_max: int = 60

var gravity = 600
#var velocity: Vector2 = Vector2.ZERO
var direction = "left"

@onready var sprite = $Sprite2D
@onready var collShape = $CollisionShape2D
@onready var animPlayer = $AnimationPlayer
@onready var hurtbox = $Hurtbox

func get_hp():
	return hp

func set_hp(value):
	if value != hp:
		hp = clamp(value, 0, hp_max)
		emit_signal("hp_changed", hp)
		if hp == 0:
			emit_signal("died")
		
func set_hp_max(value):
	if value != hp_max:
		hp_max = max(0, value)
		emit_signal("hp_max_changed", hp_max)
		self.hp = hp

func _physics_process(delta):
	move()
	velocity.y += gravity * delta
	set_velocity(velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()
	if is_on_floor():
		velocity.y = 0

func move():
	set_velocity(velocity)
	move_and_slide()
	velocity = velocity
	
func die():
	queue_free()

func recieve_damage(base_damage: int):
		var actual_damage = base_damage
		actual_damage -= defence
		
		self.hp -= actual_damage
		print(name + "recieved" + str(actual_damage) + "damage")

func _on_Hurtbox_area_entered(hitbox):
	recieve_damage(hitbox.damage)

func _on_entity_base_hp_max_changed(_new_hp_max):
	pass

func _on_entity_base_died():
	die()
	print("Player died")
