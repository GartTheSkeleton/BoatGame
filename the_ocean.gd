extends Node2D

var wave = preload("res://wave.tscn")

var wave_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if wave_count < 13:
		wave_count += 1
		
		var new_wave = wave.instantiate()
		new_wave.position.x = (128*wave_count)
		add_child(new_wave)
