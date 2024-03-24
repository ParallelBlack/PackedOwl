extends Node2D

@onready var charOwen = $Owen
@onready var charOwenUI = $Owen/UIActivator
@onready var UI_home = $UI_Handler/E_home
@onready var UI_garage = $UI_Handler/E_garage
@onready var UI_weaver = $UI_Handler/E_weaver
@onready var UI_Eanim = $UI_Handler/E_home/Sprite2D/AnimationPlayer
@onready var DBOXText = $UI_Handler/PlayerUI/Camera2D/DialogueBox/DBoxText
@onready var DBOXAnim = $UI_Handler/PlayerUI/Camera2D/DialogueBox/AnimationPlayer
@onready var DBOXPortrait = $UI_Handler/PlayerUI/Camera2D/DialogueBox/Avatar
#@onready var DBOXTimer = $UI_Handler/PlayerUI/Camera2D/DialogueBox/DialogueTimer
#@onready var DBOXTimer2 = $UI_Handler/PlayerUI/Camera2D/DialogueBox/DialogueTimer2
@onready var Timer_garage = $UI_Handler/DBOXTimerHandler/DBOXTimer
@onready var Timer_weaver = $UI_Handler/DBOXTimerHandler/DBOXTimer2

@onready var cars = $Cars

#@onready var houseTiles = "res://assets/sprites/terrain/Hometown.background3 0.1.png"


var DBOXgarage: int = 0
var DBOXweaver: int = 0


func _ready():
	UI_home.visible = false
	UI_garage.visible = false
	UI_weaver.visible = false

func _process(_delta):
	UI_Eanim.play("float")
	enter_A01() #find a less costly way of handling this
	cars.position.x += 8


func _physics_process(_delta):
	read_garage()
	read_weaver()

func _on_e_home_area_entered(_area):
	print("home detected")
	UI_home.visible = true
func _on_e_home_area_exited(_area):
	UI_home.visible = false

func _on_e_garage_area_entered(_area):
	print("garage detected")
	UI_garage.visible = true
func _on_e_garage_area_exited(_area):
	UI_garage.visible = false

func _on_e_weaver_area_entered(_area):
	print("Weaver detected")
	UI_weaver.visible = true
func _on_e_weaver_area_exited(_area):
	UI_weaver.visible = false




func enter_A01():
	if UI_home.visible:
		if Input.is_action_just_pressed("interact"):
			print("pressed!")
			get_tree().change_scene_to_file("res://scenes/zones/1. hometown/a_01.tscn")
	else: return

func read_garage():
	if UI_garage.visible:
		if Input.is_action_just_pressed("interact"):
			if DBOXgarage == 0:
				DBOXText.text = "No point in driving when Illia's place is so close by."
				DBOXAnim.play("Read")
				DBOXPortrait.frame = 3
				Timer_garage.start()
#				DBOXTimer.start()
				print("Garage 1st")
		if Input.is_action_just_pressed("interact"):
			DBOXAnim.seek(0, true)
			if DBOXgarage == 1:
				DBOXText.text = "..."
				DBOXAnim.play("Read")
				DBOXPortrait.frame = 2
				Timer_garage.start()
#				DBOXTimer.start()
				print("Garage 2nd")
		if Input.is_action_just_pressed("interact"):
			DBOXAnim.seek(0, true)
			if DBOXgarage == 2:
				DBOXText.text = "Ugh, I can't drive when I'm horny, anyway!"
				DBOXAnim.play("Read")
				DBOXPortrait.frame = 7
				print("Garage 3rd")
				DBOXgarage = 0

func read_weaver():
	if UI_weaver.visible:
		if Input.is_action_just_pressed("interact"):
			if DBOXweaver == 0:
				DBOXText.text = "Morning, Owen!"
				DBOXAnim.play("Read")
				DBOXPortrait.frame = 0
				Timer_weaver.start()
#				DBOXTimer2.start()
				print("Weaver 1st")
		if Input.is_action_just_pressed("interact"):
			DBOXAnim.seek(0, true)
			if DBOXweaver == 1:
				DBOXText.text = "Good morning, Mr. Weaver!"
				DBOXAnim.play("Read")
				DBOXPortrait.frame = 3
				print("Weaver 2nd")
				DBOXweaver = 0


func _on_dbox_timer_timeout():
	DBOXgarage += 1

func _on_dbox_timer_2_timeout():
	DBOXweaver += 1
