#BRUNO DOS SANTOS PINTO
extends CanvasLayer

signal start_game
@onready var message_label = $Control/messagelabel
@onready var message_timer = $messagetimer
@onready var score_label = $Control/scorelabel
@onready var start_button = $Control/startbutton

func show_message(text):
	message_label.text = text
	message_label.show()
	message_timer.start()
	
	
func show_game_over():
	show_message("game over")
	await message_timer.timeout
	
	message_label.text = "bruno"
	message_label.show()
	
	await get_tree().create_timer(1.0).timeout
	start_button.show()
	
func update_score(score):
	score_label.text = str(score)
	
func _on_startbutton_pressed():
	start_button.hide()
	start_game.emit()
	
func _on_messagetimer_timeout():
	message_label.hide()
	
#BRUNO DOS SANTOS PINTO
