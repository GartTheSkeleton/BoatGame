extends Node2D

@onready var player : Node2D = get_tree().get_first_node_in_group("player")
@onready var dialogue_box = $Panel
@onready var text_box = $Panel/Label
@onready var button1 = $Panel/Button
@onready var button2 = $Panel/Button2

var my_dialogue = "This is an encounter. Encounters can be anything you find on the high seas~!"

var range = 260 #this is the distance the encounter stops from the player (set higher for combat encounters?)

var finished = false #bool controlling the end of the encounter

var encounter = 0 #tracks the number of encounters the player has done (could be used to trigger events?)

var encounter_type = "Ship" #other types could be "Island" and "Port"


func _ready():
	dialogue_box.visible = false
	
	global_position.x = player.global_position.x + 1600
	global_position.y = player.global_position.y
	
	$Panel/Button.button_up.connect(progress_dialogue)
	$Panel/Button2.button_up.connect(progress_dialogue)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#sail if the player is currently travelling
	if player.travelling == true:
		global_position.x -= 10
	
	#stop at the player to conduct the encounter
	if (global_position.x - player.global_position.x) < range and finished == false:
		player.travelling = false
		text_box.text = my_dialogue
		dialogue_box.visible = true
		
		#pay crew salaries at port
		if encounter_type == "Port":
			for i in player.crew.length():
				player.gold -= player.crew[i][1]
				if player.gold < 0:
					get_tree().quit()
	
	#resets the encounter to the right of the screen and prepares for the next encounter
	if global_position.x < -100:
		reset_encounter()
		
func progress_dialogue():
	print("Dialogue button clicked")
	dialogue_box.visible = false
	finished = true
	player.travelling = true
	
func reset_encounter():
	global_position.x = 1600
	finished = false
	encounter += 1
	match encounter:
		1:
			my_dialogue = "My dialogue will change over time as the player encounters me."
		2:
			my_dialogue = "They keep encountering me because, there's only one encounter."
		3:
			my_dialogue = "And we just shuffle my assets and text around each time."
		4:
			my_dialogue = "Creating the illusion that I'm different each time."
