extends Node2D
@onready var quit_to_menu: Button = $Control/QuitToMenu
@onready var quit_to_menu_2: Button = $Control/QuitToMenu2
@onready var up: AudioStreamPlayer = $Control/up



func _on_quit_to_menu_button_down() -> void:
	var tween = create_tween()
	tween.tween_property(quit_to_menu, "scale", Vector2(0.95, 0.95), 0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	$Control/down.play()
	


func _on_quit_to_menu_button_up() -> void:
	var tween = create_tween()
	tween.tween_property(quit_to_menu, "scale", Vector2(1, 1), 0.15).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	$Control/up.play()
	
	

func _on_quit_to_menu_2_button_down() -> void:
	var tween = create_tween()
	tween.tween_property(quit_to_menu_2, "scale", Vector2(0.95, 0.95), 0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	$Control/down.play()

func _on_quit_to_menu_2_button_up() -> void:
	var tween = create_tween()
	tween.tween_property(quit_to_menu_2, "scale", Vector2(1, 1), 0.15).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	$Control/up.play()


func _on_quit_to_menu_pressed() -> void:
	await up.finished
	get_tree().change_scene_to_file("res://node_2d.tscn")


func _on_quit_to_menu_2_pressed() -> void:
	await up.finished
	get_tree().quit()
	
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://ClickLogic.tscn")
