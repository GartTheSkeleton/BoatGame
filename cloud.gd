extends Sprite2D

@onready var player : Node2D = get_tree().get_first_node_in_group("player")

var speed

func _ready():
	randomize()
	var speeds = [.5,1,.5,1.5]
	speeds.shuffle()
	
	speed = speeds[0]
	print(speed)



func _process(delta):
	global_position.x -= speed
		
	if global_position.x < -100:
		global_position.x = 1600
