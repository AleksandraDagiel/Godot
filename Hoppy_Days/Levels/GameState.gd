extends Node2D

var lives = 3

func _ready():
	add_to_group("GameState")
	updateGUI()

func hurt():
	lives -= 1
	$Player.hurt()
	updateGUI()
	if lives < 0:
		end_game()


func updateGUI():
	get_tree().call_group("GUI", "update_lives", lives)

func end_game():
	get_tree().change_scene("res://Levels/GameOver.tscn")
	
