extends Node2D

@onready var playerDetected : CharacterBody2D = owner.get_parent().find_child("Player")
@onready var anim : AnimationPlayer = owner.get_parent().find_child("EnemyActive")
@onready var enemyArea : Area2D = owner.get_parent().find_child("EnemySight")



func _ready():
	pass


func _process(_delta):
	pass


func _on_sight_range_area_entered(enemyArea):
	print("player spotted")
	anim.play("chase")

func _on_sight_range_area_exited(enemyArea):
	print("player lost")
	anim.play("idle")
