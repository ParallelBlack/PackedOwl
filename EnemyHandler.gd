extends Node2D


@export var EnemyActive : String
@onready var posTimer = $PosTimer

var pos : Array
var tempPos : Array
var curPos : Marker2D

var direction : Vector2 = Vector2.ZERO


#call the enemy class name and give it movement and stuff.


func _ready():
	pos = get_tree().get_nodes_in_group(EnemyActive)
	get_pos()
	get_next_pos()


func _physics_process(_delta):
	if global_position.distance_to(curPos.position) < 10:
		get_next_pos()
		posTimer.start()

func get_pos():
	tempPos = pos.duplicate()
	tempPos.shuffle()

func get_next_pos():
	if tempPos.is_empty():
		get_pos()
	curPos = tempPos.pop_front()
	direction = to_local(curPos.position).normalized()

func _on_timer_timeout():
	print(curPos)
