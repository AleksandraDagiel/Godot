extends Node2D


func _on_BGM_tree_entered():
	$BGM.stream = load("res://SFX/Chiptune_Adventures_1.ogg")
	$BGM.play()
