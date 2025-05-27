extends Node2D

@onready var mult: Button = $Control/HBoxContainer/Mult
@onready var mult_back: Button = $Control/HBoxContainer/MultBack
@onready var auto: Button = $Control/Auto
@onready var rich_text_label: RichTextLabel = $Control/RichTextLabel
@onready var timer: Timer = $Control/Timer

var bobas:int = 0
var autoEnable:bool = false
var multiAmount:int = 1
func _ready():
	mult_back.visible = false

func _process(_delta):
	rich_text_label.text = "[center] bobas gathered: " + str(bobas)
	mult.text = "Multi amount: " + str(multiAmount)

func _on_texture_button_pressed():
	bobas += multiAmount

func _on_mult_pressed():
	multiAmount += 1
	UpdateBackButton()

func _on_mult_back_pressed():
	if multiAmount > 1:
		multiAmount -= 1
	UpdateBackButton()

func _on_auto_toggled(toggled_on: bool):
	if toggled_on:
		timer.start()
	else:
		timer.stop()


func UpdateBackButton():
	if multiAmount > 1:
		mult_back.visible = true
	elif multiAmount == 1:
		mult_back.visible = false

func _on_timer_timeout() -> void:
	bobas += 1
