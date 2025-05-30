extends Node2D

@onready var auto: Button = $Control/Auto
@onready var timer: Timer = $Control/Timer
@onready var boba_count: RichTextLabel = $Control/BobaCount
@onready var rich_text_label: RichTextLabel = $Control/Panel/ScrollContainer/VBoxContainer/HBoxContainer/RichTextLabel
@onready var viet_boy_buy: RichTextLabel = $Control/Panel/ScrollContainer/VBoxContainer/HBoxContainer/VietBoyBuy
@onready var viet_man_buy: RichTextLabel = $Control/Panel/ScrollContainer/VBoxContainer/HBoxContainer2/VietManBuy
@onready var robot_buy: RichTextLabel = $Control/Panel/ScrollContainer/VBoxContainer/HBoxContainer3/RobotBuy
@onready var abb_buy: RichTextLabel = $Control/Panel/ScrollContainer/VBoxContainer/HBoxContainer4/ABBBuy
@onready var shop_buy: RichTextLabel = $Control/Panel/ScrollContainer/VBoxContainer/HBoxContainer5/ShopBuy
@onready var temple_buy: RichTextLabel = $Control/Panel/ScrollContainer/VBoxContainer/HBoxContainer6/TempleBuy
@onready var abg_buy: RichTextLabel = $Control/Panel/ScrollContainer/VBoxContainer/HBoxContainer7/ABGBuy
@onready var wages_buy: RichTextLabel = $Control/Panel/ScrollContainer2/VBoxContainer/HBoxContainer/WagesBuy
@onready var belt_buy: RichTextLabel = $Control/Panel/ScrollContainer2/VBoxContainer/HBoxContainer2/BeltBuy
@onready var book_buy: RichTextLabel = $Control/Panel/ScrollContainer2/VBoxContainer/HBoxContainer3/BookBuy
@onready var lube_buy: RichTextLabel = $Control/Panel/ScrollContainer2/VBoxContainer/HBoxContainer4/LubeBuy
@onready var rate: RichTextLabel = $Control/Rate


var bobas:int = 0
var VietBoyPrice:int = 50
var VietBoyOwn:int = 0
var VietManPrice:int = 250
var VietManOwn:int = 0
var RobotPrice:int = 1000
var RobotOwn:int = 0
var ABBPrice:int = 3000
var ABBOwn:int = 0
var ShopPrice:int = 25000
var ShopOwn:int = 0
var TemplePrice:int = 2000000
var TempleOwn:int = 0
var ABGPrice:int = 5000000
var ABGOwn:int = 0
var human_multiplier:int = 1
var child_multiplier:int = 1
var rob_abb_multiplier:int = 1


func _process(_delta):
	boba_count.text = "[center] bobas: " + str(bobas)
	rate.text = "Rate = " + str((VietBoyOwn*human_multiplier*child_multiplier)+(VietManOwn*human_multiplier*5)+(RobotOwn*19*rob_abb_multiplier)+(ABBOwn*26*rob_abb_multiplier*human_multiplier)+(ShopOwn*513)+(TempleOwn*3157 )) + " Bobas per Second (BPS)"

func _on_timer_timeout():
	bobas += (VietBoyOwn*human_multiplier*child_multiplier)+(VietManOwn*human_multiplier*5)+(RobotOwn*19*rob_abb_multiplier)+(ABBOwn*26*rob_abb_multiplier*human_multiplier)+(ShopOwn*513)+(TempleOwn*3157 )

func _on_texture_button_pressed():
	bobas += child_multiplier*human_multiplier

func _on_viet_boy_but_pressed():
	if bobas >= VietBoyPrice:
		VietBoyOwn += 1
		bobas -= VietBoyPrice
		VietBoyPrice = 50*((1.15)**VietBoyOwn)
	viet_boy_buy.text = "Vietnamese Boy: " + str(VietBoyOwn) + "\n" + "Price: "+ str(VietBoyPrice) + "\n" + str(1*child_multiplier*human_multiplier) +" bps"


func _on_viet_man_but_pressed():
	if bobas >= VietManPrice:
		VietManOwn += 1
		bobas -= VietManPrice
		VietManPrice = 250*((1.15)**VietManOwn)
	viet_man_buy.text = "Vietnamese Man: " + str(VietManOwn) + "\n" + "Price: "+ str(VietManPrice) + "\n" + str(5*human_multiplier) + " bps"


func _on_robot_but_pressed() -> void:
	if bobas >= RobotPrice:
		RobotOwn += 1
		bobas -= RobotPrice
		RobotPrice = 1000*((1.15)**RobotOwn)
	robot_buy.text = "Robot: " + str(RobotOwn) + "\n" + "Price: "+ str(RobotPrice) + "\n" + str(19*rob_abb_multiplier) + " bps"




func _on_abb_but_pressed() -> void:
	if bobas >= ABBPrice:
		ABBOwn += 1
		bobas -= ABBPrice
		ABBPrice = 3000*((1.15)**ABBOwn)
	abb_buy.text = "ABB: " + str(ABBOwn) + "\n" + "Price: "+ str(ABBPrice) + "\n" + str(26*rob_abb_multiplier*human_multiplier) + " bps"


func _on_shop_but_pressed() -> void:
	if bobas >= ShopPrice:
		ShopOwn += 1
		bobas -= ShopPrice
		ShopPrice = 25000*((1.15)**ShopOwn)
	shop_buy.text = "Franchise: " + str(ShopOwn) + "\n" + "Price: "+ str(ShopPrice) + "\n" + "513 bps"


func _on_temple_but_pressed() -> void:
	if bobas >= TemplePrice:
		TempleOwn += 1
		bobas -= TemplePrice
		TemplePrice = 200000*((1.15)**TempleOwn)
	temple_buy.text = "Temple: " + str(TempleOwn) + "\n" + "Price: "+ str(TemplePrice) + "\n" + "3157 bps"



func _on_abg_but_pressed() -> void:
	if bobas >= ABGPrice:
		ABGOwn += 1
		bobas -= ABGPrice
	abg_buy.text = "ABG: " + str(ABGOwn) + "\n" + "Price: 50M" + "\n" + "Final Prize 👅👅"


func update_rate():
	viet_boy_buy.text = "Vietnamese Boy: " + str(VietBoyOwn) + "\n" + "Price: "+ str(VietBoyPrice) + "\n" + str(1*child_multiplier*human_multiplier) +" bps"
	viet_man_buy.text = "Vietnamese Man: " + str(VietManOwn) + "\n" + "Price: "+ str(VietManPrice) + "\n" + str(5*human_multiplier) + " bps"
	robot_buy.text = "Robot: " + str(RobotOwn) + "\n" + "Price: "+ str(RobotPrice) + "\n" + str(19*rob_abb_multiplier) + " bps"
	abb_buy.text = "ABB: " + str(ABBOwn) + "\n" + "Price: "+ str(ABBPrice) + "\n" + str(26*rob_abb_multiplier*human_multiplier) + " bps"

func _on_wages_but_pressed() -> void:
	if bobas >= 340:
		bobas -= 340
		human_multiplier = human_multiplier*2
		wages_buy.text = "Bought!"
		update_rate()




func _on_belt_but_pressed() -> void:
	if bobas >= 3000:
		bobas -= 3000
		child_multiplier = 7
		belt_buy.text = "Bought!"
		update_rate()



func _on_book_but_pressed() -> void:
	if bobas >= 8000:
		bobas -= 8000
		human_multiplier= human_multiplier * 1.5
		book_buy.text="Bought!"
		update_rate()


func _on_lube_but_pressed() -> void:
	if bobas >= 50000:
		bobas -= 50000
		rob_abb_multiplier = 4
		lube_buy.text = "Bought!"
		update_rate()
