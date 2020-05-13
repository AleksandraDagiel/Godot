extends CanvasLayer


func _ready():
	$Control/TextureRect/HBoxContainer/LiveCount.text = "3"
	
func update_lives(lives_left):
	$Control/TextureRect/HBoxContainer/LiveCount.text = str(lives_left)
	


	
