extends Node2D

@onready var nav = $NavigationAgent2D
@onready var target : CharacterBody2D = owner.get_parent().find_child("Player")



func update_target():
	nav.target_position = target.position
