extends "res://scenes/resources/hitbox.gd"

@export var SPEED: int = 720

func _physics_process(delta): #This code might only be relevant if the sprite is rotated, as shown in the Combat Essentials video. All I need is for the sprite to mirror horizontally since it can only be fired those ways.
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += SPEED *direction * delta

func destroy():
	queue_free()

func _on_OwlFeather_area_entered(area):
	destroy()


func _on_OwlFeather_body_entered(body):
	destroy()
