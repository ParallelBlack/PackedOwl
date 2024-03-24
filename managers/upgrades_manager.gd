extends Node

@onready var sparkleText = $sparkleText #find a way to connec this to Owen's UI instead.

var sparkleCounter : int = 0 #money or exp dropped from enemies
var doubleUp : bool = false
var featherUp : bool = false
var chargeUp : bool = false



func _ready():
	SignalBus.itemCollected.connect(itemCollected)

func itemCollected(value : int) -> void:
	sparkleCounter += value
	sparkleText.text = str(sparkleCounter)
