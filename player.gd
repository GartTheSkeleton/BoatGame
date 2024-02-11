extends Node2D

var cannonball_scene = preload("res://cannonball.tscn")

var travelling = true

var gold = 100

var crew = [
	["Jimmy the Fool",10] #structure [name,salary]
]

# Called when the node enters the scene tree for the first time.
func _ready():
	global_position.y = 360 #sets it at the middle of the screen



func _process(_delta):
	HandleShooting()


func HandleShooting():
	if Input.is_action_just_pressed("shoot"):
		var cannonball_instance = cannonball_scene.instantiate()
		cannonball_instance.position = get_global_position()
		cannonball_instance.rotation = get_angle_to(get_global_mouse_position())
		get_parent().add_child(cannonball_instance)

