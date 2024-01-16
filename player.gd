extends Node2D

var travelling = true

var gold = 100

var crew = [
	["Jimmy the Fool",10] #structure [name,salary]
]

# Called when the node enters the scene tree for the first time.
func _ready():
	global_position.y = 360 #sets it at the middle of the screen



func _process(delta):
	pass
