extends Node2D


@onready var voreSprite = $TestEnemy/VoreSprite
@onready var voreAnim = $TestEnemy/AnimationPlayer


func _ready():
	voreSprite.visible = false
	voreAnim.play("idle")
	pass


func _process(_delta):
	pass



func _on_sight_area_entered(_area):
	print("I see Owen")
func _on_sight_area_exited(_area):
	print("I don't see Owen")


func _on_grab_area_entered(_area):
	print("grabbing range entered")
	voreSprite.visible = true
	voreAnim.play("vore1")
	
func _on_grab_area_exited(_area):
	print("grabbing range exited")
	voreSprite.visible = false
	voreAnim.seek(0, true)
#	voreAnim.play("confused")

