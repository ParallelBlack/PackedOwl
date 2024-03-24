extends Node2D


@onready var DBOX = $Camera2D/DialogueBox
@onready var DBOXAnim = $Camera2D/DialogueBox/AnimationPlayer


func _ready():
	pass


func _process(_delta):
	show_dialogue()
	hide_dialogue()


func show_dialogue():
	if Input.is_action_just_pressed("interact") and !DBOX.visible:
		DBOX.visible = true
		print("dBOX shown")

func hide_dialogue():
	if Input.is_action_just_pressed("ui_pause") and DBOX.visible:
		DBOX.visible = false
		DBOXAnim.stop()
		print("dBOX hidden")
