extends Node2D

var much_raund = 0
var timer

func _init():
	timer = Timer.new()
	add_child(timer)
	timer.autostart = true
	timer.wait_time = random_time()
	timer.connect("timeout", self, "_timeout")


func _timeout():
	if Global.shut_play == true:
		rand_shut_list()
	else: pass
	

func rand_shut_list():
	var data_rand = random_timeout_shut()
	if data_rand == 0:
		shut1()
	elif data_rand == 1:
		shut2()
	elif data_rand == 2:
		shut3()
	elif data_rand == 3:
		shut4()

func random_shut():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var random_int_num = rng.randi_range(1, 8)
	return random_int_num

func random_timeout_shut():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var random_int_num = rng.randi_range(0, 3)
	return random_int_num
	
func random_time():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var random_int_num = rng.randi_range(6, 8)
	return random_int_num

func shut1():
	var data_rand = random_shut()
	$episod2/workstate/shut_icon.visible = true
	var animation_list = $episod2/shut_go1.get_animation_list()
	var random_animation = animation_list[data_rand]
	$episod2/shut_go1.play(random_animation)
	
func shut2():
	var data_rand = random_shut()
	$episod2/workstate/shut_icon2.visible = true
	var animation_list = $episod2/shut_go2.get_animation_list()
	var random_animation = animation_list[data_rand]
	$episod2/shut_go2.play(random_animation)
	
func shut3():
	var data_rand = random_shut()
	$episod2/workstate/shut_icon3.visible = true
	var animation_list = $episod2/shut_go3.get_animation_list()
	var random_animation = animation_list[data_rand]
	$episod2/shut_go3.play(random_animation)

func shut4():
	var data_rand = random_shut()
	$episod2/workstate/shut_icon4.visible = true
	var animation_list = $episod2/shut_go4.get_animation_list()
	var random_animation = animation_list[data_rand]
	$episod2/shut_go4.play(random_animation)


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.shut_play = true
	Global.skazka_items = 0
	$"%finish".hide()
	if Global.zvuk == true:
		$episod2/workstate/menu_panel/zvuk2.pressed = false
	elif Global.zvuk == false:
		$episod2/workstate/menu_panel/zvuk2.pressed = true


func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_FOCUS_IN and Global.zvuk == true: AudioServer.set_bus_mute(0, false)
	elif what == MainLoop.NOTIFICATION_WM_FOCUS_OUT: AudioServer.set_bus_mute(0, true)


func _on_shut_icon_pressed():
	$episod2/smeh.play()
	get_node("%menu_panel2/%much_max_anim2").play("min_10")
	Global.skazka_items += 1
	get_node("%menu_panel2/%much_raund").text = str(Global.skazka_items)
	$episod2/workstate/shut_icon.visible = false

func _on_shut_icon2_pressed():
	$episod2/smeh.play()
	get_node("%menu_panel2/%much_max_anim2").play("min_10")
	Global.skazka_items += 1
	get_node("%menu_panel2/%much_raund").text = str(Global.skazka_items)
	$episod2/workstate/shut_icon2.visible = false

func _on_shut_icon3_pressed():
	$episod2/smeh.play()
	get_node("%menu_panel2/%much_max_anim2").play("min_10")
	Global.skazka_items += 1
	get_node("%menu_panel2/%much_raund").text = str(Global.skazka_items)
	$episod2/workstate/shut_icon3.visible = false

func _on_shut_icon4_pressed():
	$episod2/smeh.play()
	get_node("%menu_panel2/%much_max_anim2").play("min_10")
	Global.skazka_items += 1
	get_node("%menu_panel2/%much_raund").text = str(Global.skazka_items)
	$episod2/workstate/shut_icon4.visible = false


func _on_more_pressed():
	get_tree().change_scene("res://scenes/skazka.tscn")


func _on_exit_pressed():
	Global.summ_items += Global.skazka_items
	get_tree().change_scene("res://scenes/main.tscn")
