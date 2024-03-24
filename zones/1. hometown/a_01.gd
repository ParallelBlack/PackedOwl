extends Node2D

@onready var Owen = $Owen
@onready var BGFade = $Owen/BGFade
@onready var Exit_UI = $Exit_UI

var canInteract: bool = false

func _ready():
	Owen.anim.play("Owenidle")
	BGFade.visible = true
	Exit_UI.visible = false



func _process(_delta):
	exit_home()

func _on_exit_e_area_entered(_area):
	print("player detected")
	Exit_UI.visible = true
	canInteract = true
func _on_exit_e_area_exited(_area):
	Exit_UI.visible = false
	canInteract = false


func exit_home():
	if Exit_UI.visible:
		canInteract = true
		if Input.is_action_just_pressed("interact") and canInteract:
			print("pressed!")
			get_tree().change_scene_to_file("res://scenes/zones/1. hometown/hometown_testlevel.tscn")
	else: return

