extends Control

var music_bus = AudioServer.get_bus_index("Master")
var question_number = 0
var question_result = false
var question_def = false
var question_answer = 0
var random_number_q_ans_num = 11
var question_list = ["Что попросил Горшок у Короля в обмен на спасение Принцессы?", 
"Где находится Дурак когда Князь впервые его встречает?", 
"Что попросил Себастьян в замен на лечебное зелье, которое должно было спасти Князя?", 
"Кто пробрался в дом когда Горшок ужинал с Вдовой?", 
"Где Князь встречает Принцессу?",
"Что делает Принцесса когда Князь встречает её в первый раз?", 
"Что вытягивает Колдун из людей?", 
"Что пытается открыть Колдун?", 
"В чем особенность меча у Горшка?", 
"Какое животное Князь приготовил на ужин для Принцессы?", 
"За кого должна была выйти замуж Принцесса?", 
"Какая мечта у Горшка?"]

var answer_list = [["Быть менестрелем", "Быть рыцарем", "Быть казначеем", "Быть принцем"],
["В клетке", "На дереве", "В доме", "На мосту"],
["Убить его", "Накормить его", "Спрятать его", "Напоить его"],
["Горбун", "Гоблин", "Упырь", "Гном"],
["У воды", "В замке", "На холме", "У вдовы"],
["Качается на качелях", "Трясётся от страха", "Собирает грибы", "Любуется в зеркало"],
["Душу", "Деньги", "Сны", "Радость"],
["Портал", "Банку", "Тайну", "Глаза"],
["Он сломан", "Он топор", "Он заколдован", "Он невидимка"],
["Кролика", "Крысу", "Курицу", "Лису"],
["За Безноктного", "За Безногого", "За Безрукого", "За Безпальцного"],
["Обрести бессмертие", "Быть неуязвимым", "Ходить сквозь стены", "Летать по воздуху"]]


func _ready():
	$show.play("show_int")

func _on_back_pressed():
	$"%shure".show()
	

func full_random():
	var question_index = random_number_q_ans()
	question_result = false
	var come_back = question_list[question_index]
	var quest_answer = answer_list[question_index]
	var response = []
	response += [[come_back],quest_answer]
	question_list.remove(question_index)
	answer_list.remove(question_index)
	return response
	
func random_number_ans():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var random_int_num = rng.randi_range(0, 3)
	return random_int_num
	
func random_number_q_ans():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var random_int_num = rng.randi_range(0, random_number_q_ans_num)
	random_number_q_ans_num -= 1
	return random_int_num
	
func quest_num():
	var quest_full = full_random()
	var quest_text = quest_full[0][0]
	var answer_true = quest_full[1]
	var answer_1 = ""
	var answer_2 = ""
	var answer_3 = ""
	var answer_4 = ""
	var randomiz = random_number_ans()

	if randomiz == 0:
		answer_1 = answer_true[0]
		question_answer = 1
		answer_true.erase(answer_1)
		var answer_2_index = randi() % answer_true.size()
		var answer_2_text = answer_true[answer_2_index]
		answer_2 = answer_2_text
		answer_true.erase(answer_2)
		var answer_3_index = randi() % answer_true.size()
		var answer_3_text = answer_true[answer_3_index]
		answer_3 = answer_3_text
		answer_true.erase(answer_3)
		var answer_4_index = randi() % answer_true.size()
		var answer_4_text = answer_true[answer_4_index]
		answer_4 = answer_4_text
		answer_true.erase(answer_4)
	elif randomiz == 1:
		answer_2 = answer_true[0]
		question_answer = 2
		answer_true.erase(answer_2)
		var answer_1_index = randi() % answer_true.size()
		var answer_1_text = answer_true[answer_1_index]
		answer_1 = answer_1_text
		answer_true.erase(answer_1)
		var answer_3_index = randi() % answer_true.size()
		var answer_3_text = answer_true[answer_3_index]
		answer_3 = answer_3_text
		answer_true.erase(answer_3)
		var answer_4_index = randi() % answer_true.size()
		var answer_4_text = answer_true[answer_4_index]
		answer_4 = answer_4_text
		answer_true.erase(answer_4)
	elif randomiz == 2:
		answer_3 = answer_true[0]
		question_answer = 3
		answer_true.erase(answer_3)
		var answer_2_index = randi() % answer_true.size()
		var answer_2_text = answer_true[answer_2_index]
		answer_2 = answer_2_text
		answer_true.erase(answer_2)
		var answer_1_index = randi() % answer_true.size()
		var answer_1_text = answer_true[answer_1_index]
		answer_1 = answer_1_text
		answer_true.erase(answer_1)
		var answer_4_index = randi() % answer_true.size()
		var answer_4_text = answer_true[answer_4_index]
		answer_4 = answer_4_text
		answer_true.erase(answer_4)
	elif randomiz == 3:
		answer_4 = answer_true[0]
		question_answer = 4
		answer_true.erase(answer_4)
		var answer_2_index = randi() % answer_true.size()
		var answer_2_text = answer_true[answer_2_index]
		answer_2 = answer_2_text
		answer_true.erase(answer_2)
		var answer_3_index = randi() % answer_true.size()
		var answer_3_text = answer_true[answer_3_index]
		answer_3 = answer_3_text
		answer_true.erase(answer_3)
		var answer_1_index = randi() % answer_true.size()
		var answer_1_text = answer_true[answer_1_index]
		answer_1 = answer_1_text
		answer_true.erase(answer_1)
	else: pass
	
	$"%q_text".text = quest_text
	$"%answ_1".text = answer_1
	$"%answ_2".text = answer_2
	$"%answ_3".text = answer_3
	$"%answ_4".text = answer_4
	question_number += 1
	print(question_number)

func _process(delta):
	if (question_number >= 0 or question_number < 11) and question_def == false:
		quest_num()
		question_def = true
	elif question_number == 11:
		$"%finish".show()
		$"%finish/%much_raund_finish".text = str(Global.skazka_items)
		$"%back".disabled = true
		$"%answ_1".disabled = true
		$"%answ_2".disabled = true
		$"%answ_3".disabled = true
		$"%answ_4".disabled = true
		Global.shut_play = false

func _on_hide_animation_finished(hide_init):
	get_tree().change_scene("res://scenes/main.tscn")


func _on_zvuk2_pressed():
	if Global.zvuk != false:
		Global.zvuk = false
		AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))
	else: 
		Global.zvuk = true
		AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))
	print(Global.zvuk)


func _on_answ_1_pressed():
	if question_answer == 1:
		$moneta.play()
		get_node("%menu_panel2/%much_max_anim2").play("min_10")
		$"%answ_1".modulate = Color("#228b22")
		yield(get_tree().create_timer(0.1), "timeout")
		$"%answ_1".modulate = Color("#ffffff")
		Global.skazka_items += 1
		get_node("%menu_panel2/%much_raund").text = str(Global.skazka_items)
	elif question_answer != 1:
		$"%answ_1".modulate = Color("#ff0000")
		yield(get_tree().create_timer(0.1), "timeout")
		$"%answ_1".modulate = Color("#ffffff")
	question_def = false

func _on_answ_2_pressed():
	if question_answer == 2:
		$moneta.play()
		get_node("%menu_panel2/%much_max_anim2").play("min_10")
		$"%answ_2".modulate = Color("#228b22")
		yield(get_tree().create_timer(0.1), "timeout")
		$"%answ_2".modulate = Color("#ffffff")
		Global.skazka_items += 1
		get_node("%menu_panel2/%much_raund").text = str(Global.skazka_items)
	elif question_answer != 2:
		$"%answ_2".modulate = Color("#ff0000")
		yield(get_tree().create_timer(0.1), "timeout")
		$"%answ_2".modulate = Color("#ffffff")
	question_def = false


func _on_answ_3_pressed():
	if question_answer == 3:
		$moneta.play()
		get_node("%menu_panel2/%much_max_anim2").play("min_10")
		$"%answ_3".modulate = Color("#228b22")
		yield(get_tree().create_timer(0.1), "timeout")
		$"%answ_3".modulate = Color("#ffffff")
		Global.skazka_items += 1
		get_node("%menu_panel2/%much_raund").text = str(Global.skazka_items)
	elif question_answer != 3:
		$"%answ_3".modulate = Color("#ff0000")
		yield(get_tree().create_timer(0.1), "timeout")
		$"%answ_3".modulate = Color("#ffffff")
	question_def = false


func _on_answ_4_pressed():
	if question_answer == 4:
		$moneta.play()
		$"%answ_4".modulate = Color("#228b22")
		yield(get_tree().create_timer(0.1), "timeout")
		$"%answ_4".modulate = Color("#ffffff")
		get_node("%menu_panel2/%much_max_anim2").play("min_10")
		Global.skazka_items += 1
		get_node("%menu_panel2/%much_raund").text = str(Global.skazka_items)
	elif question_answer != 4:
		$"%answ_4".modulate = Color("#ff0000")
		yield(get_tree().create_timer(0.1), "timeout")
		$"%answ_4".modulate = Color("#ffffff")
	question_def = false


func _on_shure_yes_pressed():
	$hide.play("hide_init")


func _on_shure_no_pressed():
	$"%shure".hide()


func _on_exit_plus_pressed():
	Global.summ_items += 5
	Global.summ_items += Global.skazka_items
	get_tree().change_scene("res://scenes/main.tscn")
