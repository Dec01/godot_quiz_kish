extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_zamok_hronika_pressed():
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
		Global.hronika_blok = false
