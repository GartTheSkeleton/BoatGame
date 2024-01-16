extends Sprite2D

var encounter1 = preload("res://encounter.tscn")

var wave_amount = 1
var wave_timer = 6

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += wave_amount
	
	wave_timer -= 1
	if wave_timer <= 0:	
		wave_timer = 6
		match wave_amount:
			1:
				wave_amount = .5
			-1:
				wave_amount = -.5
			.5:
				wave_amount = -1
			-.5:
				wave_amount = 1
