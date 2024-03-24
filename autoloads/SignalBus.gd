extends Node

signal itemCollected(value : int)

func emit_on_item_collected(value : int) -> void:
	itemCollected.emit(value)
