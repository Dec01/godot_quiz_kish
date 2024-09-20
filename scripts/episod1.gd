extends Control

var music_bus = AudioServer.get_bus_index("Master")

func _ready():
	$"workstate/%popup_blok".hide()
	$"workstate/%popup_blok2".hide()
	$"workstate/menu_panel/%much".text = str(Global.summ_items)

func _on_skazka_pressed():
	$workstate/menu/scene_skazka.play("hide_menu")

func _on_pesnya_pressed():
	$workstate/menu/scene_pesnya.play("hide_menu")

func _on_hronika_pressed():
	$workstate/menu/scene_hronika.play("hide_menu")

func _on_shut_pressed():
	if Global.pop_up_help == false:
		$"%popup_blok2".show()
		Global.pop_up_help = true
	elif Global.pop_up_help == true:
		$"%popup_blok2".hide()
		Global.pop_up_help = false


func _on_zvuk_pressed():
	if Global.zvuk != false:
		Global.zvuk = false
		AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))
	else: 
		Global.zvuk = true
		AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))
	print(Global.zvuk)


func _on_add_coin_sho2_pressed():
	$"%add_coin_sho2".disabled = true
