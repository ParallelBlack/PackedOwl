extends Area2D

var value : int = 1

func _ready():
	
	pass


func _on_body_entered(body : CharacterBody2D):
	if !body.is_in_group("Player"):
		return
	
	SignalBus.emit_on_item_collected(value)
	queue_free()
