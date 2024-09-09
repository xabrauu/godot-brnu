#BRUNO DOS SANTOS PINTO
extends Node2D

@export var bug_scene : PackedScene
var score
	
func game_over():
	$bugTimer.stop()
	$scoreTimer.stop()
	$hud.show_game_over()
	$bgmusic.stop()
	$gameoversound.play()
	
func new_game():
	$startTimer.start()
	$player.start_pos($startposition.position)
	score = 0
	$hud.update_score(score)
	$hud.show_message("get ready")
	get_tree().call_group("bugs", "queue_free")
	$bgmusic.play()
	
	
func _on_score_timer_timeout():
	$hud.update_score(score)
	score += 1
func _on_start_timer_timeout():
	$bugTimer.start()
	$scoreTimer.start()
	
	
func _on_bug_timer_timeout():
	var bug = bug_scene.instantiate()
	var bug_location = $bugpath/bugpathLocation
	bug_location.progress_ratio = randf()
	
	var direction = bug_location.rotation + PI / 2
	bug.position = bug_location.position 
	direction += randf_range(-PI /4, PI /4)
	bug.rotation = direction
	
	var velocity =Vector2(randf_range(150.0,250.0), 0.0)
	bug.linear_velocity = velocity.rotated(direction)
	add_child(bug)
	
	#BRUNO DOS SANTOS PINTO
	
	
#BRUNO DOS SANTOS PINTO
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	




