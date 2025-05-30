extends Node2D

@onready var auto: Button = $Control/Auto
@onready var timer: Timer = $Control/Timer
@onready var boba_count: RichTextLabel = $Control/BobaCount
@onready var rich_text_label: RichTextLabel = $Control/Panel/ScrollContainer/VBoxContainer/HBoxContainer/RichTextLabel
@onready var viet_boy_buy: RichTextLabel = $Control/Panel/ScrollContainer/VBoxContainer/HBoxContainer/VietBoyBuy
@onready var viet_man_buy: RichTextLabel = $Control/Panel/ScrollContainer/VBoxContainer/HBoxContainer2/VietManBuy
@onready var robot_buy: RichTextLabel = $Control/Panel/ScrollContainer/VBoxContainer/HBoxContainer3/RobotBuy

var bobas:int = 10000000
var autoEnable:bool = false
var multiAmount:int = 1
var VietBoyPrice:int = 50
var VietBoyOwn:int = 0
var VietManPrice:int = 250
var VietManOwn:int = 0
var RobotPrice:int = 1000
var RobotOwn:int = 0

func _process(_delta):
	boba_count.text = "[center] bobas: " + str(bobas)

func _on_timer_timeout():
	bobas += (VietBoyOwn)+(VietManOwn*5)+(RobotOwn*19)

func _on_texture_button_pressed():
	bobas += multiAmount

func _on_viet_boy_but_pressed():
	if bobas >= VietBoyPrice:
		VietBoyOwn += 1
		bobas -= VietBoyPrice
		VietBoyPrice = 50*((1.15)**VietBoyOwn)
	viet_boy_buy.text = "Vietnamese Boy: " + str(VietBoyOwn) + "\n" + "Price: "+ str(VietBoyPrice) + "\n" + "1 bps"


func _on_viet_man_but_pressed():
	if bobas >= VietManPrice:
		VietManOwn += 1
		bobas -= VietManPrice
		VietManPrice = 250*((1.15)**VietManOwn)
	viet_man_buy.text = "Vietnamese Man: " + str(VietManOwn) + "\n" + "Price: "+ str(VietManPrice) + "\n" + "5 bps"


func _on_robot_but_pressed() -> void:
	if bobas >= RobotPrice:
		RobotOwn += 1
		bobas -= RobotPrice
		RobotPrice = 1000*((1.15)**RobotOwn)
	robot_buy.text = "Robot: " + str(RobotOwn) + "\n" + "Price: "+ str(RobotPrice) + "\n" + "19 bps"
