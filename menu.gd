extends Node2D
@onready var texture_rect: TextureRect = $Control/TextureRect
@onready var animation_player: AnimationPlayer = $Control/TextureRect/AnimationPlayer
@onready var menu: Button = $Control/TextureRect/Menu
@onready var settings: Button = $Control/TextureRect/Settings
@onready var upsound: AudioStreamPlayer = $Control/up
@onready var menumusic: AudioStreamPlayer = $menumusic

func _ready():
	animation_player.play()
	

func _on_button_button_down() -> void:
	var tween = create_tween()
	tween.tween_property(menu, "scale", Vector2(0.95, 0.95), 0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	$Control/down.play()
	

func _on_menu_button_up() -> void:
	var tween = create_tween()
	tween.tween_property(menu, "scale", Vector2(1, 1), 0.15).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	$Control/up.play()


func _on_settings_button_down() -> void:
	var tween = create_tween()
	tween.tween_property(settings, "scale", Vector2(0.95, 0.95), 0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	$Control/down.play()
	
func _on_settings_button_up() -> void:
	var tween = create_tween()
	tween.tween_property(settings, "scale", Vector2(1, 1), 0.15).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	$Control/up.play()
	
func _on_menu_pressed() -> void:
	await upsound.finished #literally js so the click clack sound is finished
	get_tree().change_scene_to_file("res://ClickLogic.tscn")
	

func _on_settings_pressed() -> void:
	await upsound.finished #literally js so the click clack sound is finished
	get_tree().change_scene_to_file("res://settings.tscn")
