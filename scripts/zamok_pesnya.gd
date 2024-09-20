extends TextureButton

func _ready():
	pass


func _on_zamok_pesnya_pressed():
	if Global.pop_up_blok == false and Global.summ_items < 10:
		$"%popup_blok".show()
		Global.pop_up_blok = true
	elif Global.pop_up_blok == true:
		$"%popup_blok".hide()
		Global.pop_up_blok = false
	elif Global.pop_up_blok == false and Global.summ_items >= 10:
		
		get_node("%menu_panel/%much_min_anim").play("min_10")
		Global.summ_items -= 10
		get_node("%menu_panel/%much").text = str(Global.summ_items)
		Global.pesnya_blok = false
		
