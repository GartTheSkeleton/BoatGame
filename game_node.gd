extends Node2D

var encounter1 = preload("res://encounter.tscn")

var next_encounter #the next encounter node is stored here
var curr_encounter #the current encounter node is stored here


func _ready():
	
	next_encounter = encounter1.instantiate()# identify the encoutner node, must happen after _ready()
	
	add_child(next_encounter)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
