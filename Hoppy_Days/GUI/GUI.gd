extends CanvasLayer


func _ready():
	$Control/TextureRect/HBoxContainer/LiveCount.text = "3"
	
func update_GUI(lives_left, coins):
	$Control/TextureRect/HBoxContainer/LiveCount.text = str(lives_left)
	$Control/TextureRect/HBoxContainer/CoinCount.text = str(coins)
	
