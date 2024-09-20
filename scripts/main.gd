extends Node2D

var timer

func _init():
	timer = Timer.new()
	add_child(timer)
	timer.autostart = true
	timer.wait_time = random_time()
	timer.connect("timeout", self, "_timeout")


func _timeout():
	rand_shut_list()
	

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
	$episod1/workstate/shut_icon.visible = true
	var animation_list = $episod1/shut_go1.get_animation_list()
	var random_animation = animation_list[data_rand]
	$episod1/shut_go1.play(random_animation)
	
func shut2():
	var data_rand = random_shut()
	$episod1/workstate/shut_icon2.visible = true
	var animation_list = $episod1/shut_go2.get_animation_list()
	var random_animation = animation_list[data_rand]
	$episod1/shut_go2.play(random_animation)
	
func shut3():
	var data_rand = random_shut()
	$episod1/workstate/shut_icon3.visible = true
	var animation_list = $episod1/shut_go3.get_animation_list()
	var random_animation = animation_list[data_rand]
	$episod1/shut_go3.play(random_animation)

func shut4():
	var data_rand = random_shut()
	$episod1/workstate/shut_icon4.visible = true
	var animation_list = $episod1/shut_go4.get_animation_list()
	var random_animation = animation_list[data_rand]
	$episod1/shut_go4.play(random_animation)

func _ready():
	$episod1/workstate/menu/start_anima.play("start_an")
	if Global.zvuk == true:
		$episod1/workstate/menu_panel/zvuk.pressed = false
	elif Global.zvuk == false:
		$episod1/workstate/menu_panel/zvuk.pressed = true


	
func _process(delta):
	if Global.pesnya_blok == true:
		$episod1/workstate/zamok_blok_test.play("block_test")
	elif Global.pesnya_blok == false:
		$episod1/workstate/menu/zamok_p_off.play("zzamok_p")
	if Global.hronika_blok == true:
		$episod1/workstate/zamok_blok_test2.play("block_test2")
	elif Global.hronika_blok == false:
		$episod1/workstate/menu/zamok_h_off.play("zzamok_h")
	
	
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_FOCUS_IN and Global.zvuk == true: AudioServer.set_bus_mute(0, false)
	elif what == MainLoop.NOTIFICATION_WM_FOCUS_OUT: AudioServer.set_bus_mute(0, true)


func _on_shut_icon_pressed():
	$episod1/smeh.play()
	get_node("%menu_panel/%much_max_anim2").play("min_10")
	Global.summ_items += 1
	get_node("%menu_panel/%much").text = str(Global.summ_items)
	$episod1/workstate/shut_icon.visible = false

func _on_shut_icon2_pressed():
	$episod1/smeh.play()
	get_node("%menu_panel/%much_max_anim2").play("min_10")
	Global.summ_items += 1
	get_node("%menu_panel/%much").text = str(Global.summ_items)
	$episod1/workstate/shut_icon2.visible = false

func _on_shut_icon3_pressed():
	$episod1/smeh.play()
	get_node("%menu_panel/%much_max_anim2").play("min_10")
	Global.summ_items += 1
	get_node("%menu_panel/%much").text = str(Global.summ_items)
	$episod1/workstate/shut_icon3.visible = false

func _on_shut_icon4_pressed():
	$episod1/smeh.play()
	get_node("%menu_panel/%much_max_anim2").play("min_10")
	Global.summ_items += 1
	get_node("%menu_panel/%much").text = str(Global.summ_items)
	$episod1/workstate/shut_icon4.visible = false


func _on_scene_pesnya_animation_finished(anim_name):
	get_tree().change_scene("res://scenes/pesnya.tscn")


func _on_scene_skazka_animation_finished(anim_name):
	get_tree().change_scene("res://scenes/skazka.tscn")


func _on_scene_hronika_animation_finished(anim_name):
	get_tree().change_scene("res://scenes/hronika.tscn")
