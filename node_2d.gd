extends Node2D

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
@onready var boba_button: TextureButton = $Control/BobaButton
@onready var clicknoise: AudioStreamPlayer = $Control/BobaButton/clicknoise
@onready var audio_stream_player: AudioStreamPlayer = $Control/AudioStreamPlayer

func _ready():
	timer.wait_time = 0.1
	timer.start()
	update_rate()

func _process(_delta):
	boba_count.text = "[center] bobas: " + str(GameState.bobas)
	rate.text = "Rate = " + str((GameState.VietBoyOwn * GameState.human_multiplier * GameState.child_multiplier) + (GameState.VietManOwn * GameState.human_multiplier * 5) + (GameState.RobotOwn * 19 * GameState.rob_abb_multiplier) + (GameState.ABBOwn * 26 * GameState.rob_abb_multiplier * GameState.human_multiplier) + (GameState.ShopOwn * 513) + (GameState.TempleOwn * 3157)) + " Bobas per Second (BPS)"

func _on_timer_timeout():
	var now = Time.get_ticks_msec()
	for producer in GameState.producers:
		if now >= producer["next_tick"]:
			GameState.bobas += producer["bps"]
			producer["next_tick"] += producer["interval"]

func _on_boba_button_button_down():
	var tween = create_tween()
	tween.tween_property(boba_button, "scale", Vector2(0.95, 0.95), 0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	GameState.bobas += GameState.child_multiplier * GameState.human_multiplier
	clicknoise.play()

func _on_boba_button_button_up():
	var tween = create_tween()
	tween.tween_property(boba_button, "scale", Vector2(1, 1), 0.15).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	clicknoise.play()

func _on_viet_boy_but_pressed():
	if GameState.bobas >= GameState.VietBoyPrice:
		GameState.VietBoyOwn += 1
		GameState.bobas -= GameState.VietBoyPrice
		GameState.VietBoyPrice = 50 * ((1.15) ** GameState.VietBoyOwn)
		var now = Time.get_ticks_msec()
		GameState.producers.append({
			"next_tick": now + 1000,
			"interval": 1000,
			"bps": 1 * GameState.child_multiplier * GameState.human_multiplier
		})
	audio_stream_player.play()
	update_rate()

func _on_viet_man_but_pressed():
	if GameState.bobas >= GameState.VietManPrice:
		GameState.VietManOwn += 1
		GameState.bobas -= GameState.VietManPrice
		GameState.VietManPrice = 250 * ((1.15) ** GameState.VietManOwn)
		var now = Time.get_ticks_msec()
		GameState.producers.append({
			"next_tick": now + 1000,
			"interval": 1000,
			"bps": 5 * GameState.human_multiplier
		})
	audio_stream_player.play()
	update_rate()

func _on_robot_but_pressed():
	if GameState.bobas >= GameState.RobotPrice:
		GameState.RobotOwn += 1
		GameState.bobas -= GameState.RobotPrice
		GameState.RobotPrice = 1000 * ((1.15) ** GameState.RobotOwn)
		var now = Time.get_ticks_msec()
		GameState.producers.append({
			"next_tick": now + 1000,
			"interval": 1000,
			"bps": 19 * GameState.rob_abb_multiplier
		})
	audio_stream_player.play()
	update_rate()

func _on_abb_but_pressed():
	if GameState.bobas >= GameState.ABBPrice:
		GameState.ABBOwn += 1
		GameState.bobas -= GameState.ABBPrice
		GameState.ABBPrice = 3000 * ((1.15) ** GameState.ABBOwn)
		var now = Time.get_ticks_msec()
		GameState.producers.append({
			"next_tick": now + 1000,
			"interval": 1000,
			"bps": 26 * GameState.rob_abb_multiplier * GameState.human_multiplier
		})
	audio_stream_player.play()
	update_rate()

func _on_shop_but_pressed():
	if GameState.bobas >= GameState.ShopPrice:
		GameState.ShopOwn += 1
		GameState.bobas -= GameState.ShopPrice
		GameState.ShopPrice = 25000 * ((1.15) ** GameState.ShopOwn)
		var now = Time.get_ticks_msec()
		GameState.producers.append({
			"next_tick": now + 1000,
			"interval": 1000,
			"bps": 513
		})
	audio_stream_player.play()
	update_rate()

func _on_temple_but_pressed():
	if GameState.bobas >= GameState.TemplePrice:
		GameState.TempleOwn += 1
		GameState.bobas -= GameState.TemplePrice
		GameState.TemplePrice = 200000 * ((1.15) ** GameState.TempleOwn)
		var now = Time.get_ticks_msec()
		GameState.producers.append({
			"next_tick": now + 1000,
			"interval": 1000,
			"bps": 3157
		})
	audio_stream_player.play()
	update_rate()

func _on_abg_but_pressed():
	if GameState.bobas >= GameState.ABGPrice:
		GameState.ABGOwn += 1
		GameState.bobas -= GameState.ABGPrice
	audio_stream_player.play()
	abg_buy.text = "ABG: " + str(GameState.ABGOwn) + "\nPrice: 50M\nFinal Prize 👅👅"

func update_rate():
	viet_boy_buy.text = "Vietnamese Boy: " + str(GameState.VietBoyOwn) + "\nPrice: " + str(GameState.VietBoyPrice) + "\n" + str(1 * GameState.child_multiplier * GameState.human_multiplier) + " bps"
	viet_man_buy.text = "Vietnamese Man: " + str(GameState.VietManOwn) + "\nPrice: " + str(GameState.VietManPrice) + "\n" + str(5 * GameState.human_multiplier) + " bps"
	robot_buy.text = "Robot: " + str(GameState.RobotOwn) + "\nPrice: " + str(GameState.RobotPrice) + "\n" + str(19 * GameState.rob_abb_multiplier) + " bps"
	abb_buy.text = "ABB: " + str(GameState.ABBOwn) + "\nPrice: " + str(GameState.ABBPrice) + "\n" + str(26 * GameState.rob_abb_multiplier * GameState.human_multiplier) + " bps"
	shop_buy.text = "Franchise: " + str(GameState.ShopOwn) + "\nPrice: " + str(GameState.ShopPrice) + "\n513 bps"
	temple_buy.text = "Temple: " + str(GameState.TempleOwn) + "\nPrice: " + str(GameState.TemplePrice) + "\n3157 bps"

func _on_wages_but_pressed():
	if GameState.bobas >= 340 and !GameState.WageBought:
		GameState.bobas -= 340
		GameState.human_multiplier *= 2
		GameState.WageBought = true
		wages_buy.text = "Bought!"
		audio_stream_player.play()
		update_rate()

func _on_belt_but_pressed():
	if GameState.bobas >= 3000 and !GameState.BeltBought:
		GameState.bobas -= 3000
		GameState.child_multiplier = 7
		GameState.BeltBought = true
		belt_buy.text = "Bought!"
		audio_stream_player.play()
		update_rate()

func _on_book_but_pressed():
	if GameState.bobas >= 8000 and !GameState.BookBought:
		GameState.bobas -= 8000
		GameState.human_multiplier *= 1.5
		GameState.BookBought = true
		book_buy.text = "Bought!"
		audio_stream_player.play()
		update_rate()

func _on_lube_but_pressed():
	if GameState.bobas >= 50000 and !GameState.LubeBought:
		GameState.bobas -= 50000
		GameState.rob_abb_multiplier = 4
		GameState.LubeBought = true
		lube_buy.text = "Bought!"
		audio_stream_player.play()
		update_rate()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://settings.tscn")
