class_name FlipHandler
extends Node2D

func handle_flip(charBody : CharacterBody2D) -> void:
	if charBody.velocity.x < 0:
		charBody.sprite.flip_h = true
	if charBody.velocity.x > 0:
		charBody.sprite.flip_h = false
