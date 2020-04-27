extends Control

var player_words = []
var template = [
		{
		"prompts" : ["a name", "movie title", "adjective"],
		"story" : "Once upon a time %s watched %s and thought it was the %s movie of the past two decades"
		},
		{
		"prompts" : ["a name", "game title", "adjective"],
		"story" : "Once upon a time %s played %s and thought he was the %s player of the past two decades"
		}
		]
var current_story

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText 
onready var DisplayText = $VBoxContainer/DisplayText

func _ready():
	set_current_story()
	DisplayText.text = "Hi. Let's start the game !  "
	check_player_words_lenght()
	PlayerText.grab_focus()


func set_current_story():
	randomize()
	current_story = template[randi() % template.size()]


func _on_PlayerText_text_entered(new_test):
	add_to_player_words()


func _on_TextureButton_pressed():
	if  is_story_done():
		get_tree().reload_current_scene()
	else:
		add_to_player_words()


func add_to_player_words():
	player_words.append(PlayerText.text)
	DisplayText.text = ''
	PlayerText.clear()
	check_player_words_lenght()

func is_story_done():
	return player_words.size() == current_story.prompts.size()


func check_player_words_lenght():
	if is_story_done():
		end_game()
	else:
		prompt_player()


func tell_story():
	DisplayText.text = current_story.story % player_words


func prompt_player():
		DisplayText.text += "May I have " + current_story.prompts[player_words.size()] + " , please?   "


func end_game():
	PlayerText.queue_free()
	start_again()
	tell_story()
	

func start_again():
	$VBoxContainer/HBoxContainer/Label.text = "try again?"













