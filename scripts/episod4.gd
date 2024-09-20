extends Control

var music_bus = AudioServer.get_bus_index("Master")
var question_number = 0
var question_result = false
var question_def = false
var question_answer = 0
var random_number_q_ans_num = 11
var question_list = ["В каком году был выпущен первый студийный альбом группы Король и Шут?", 
"В каком альбоме появилась песня 'Охотник'? ", 
"В каком году группа дала себе название 'Король и Шут'?", 
"Как называется выпущенный в 2010 году альбом группы Король и Шут?", 
"В каком году группа впервые выступила на фестивале 'НАШЕствие'?",
"В каком году группа приступила к активной работе над рок-оперой TODD, в основу сюжета которой легла легенда о серийном убийце Суини Тодде?", 
"В каком году умер Михаил Горшенёв?", 
"Скрипачка Мария Нефёдова приняла решение покинуть коллектив в связи с переездом в Америку в ... году.", 
"В каком году выходят два сольных альбома Горшка и Князя?", 
"Когда группа снимает и выпускает свои первые клипы на песни «Дурак и молния», «Блуждают тени», «Садовник» и «Внезапная голова» ?", 
"КиШ впервые собрал ДС «Юбилейный» в Петербурге на свой сольный концерт в ... году.", 
"В каком училище Ленинграда произошло знакомство Михаила Горшенёва с Андреем Князевым в 1989 году?"]

var answer_list = [["В 1996 году", "В 1994 году", "В 1995 году", "В 1997 году"],
["'Король и Шут'", "'Камнем по Голове'", "'Праздник Скоморох'", "'Ели Мясо Мужики'"],
["В 1990 году", "В 1989 году", "В 1988 году", "В 1991 году"],
["Театр демона", "Тень клоуна", "Продавец кошмаров", "Бунт на корабле"],
["В 2000 году","В 1999 году","В 2001 году","В 2002 году"],
["В 2011 году", "В 2010 году", "В 2012 году", "В 2009 году"],
["Горшок жив", "В 2012 году", "В 2014 году", "В 2015 году"],
["2004", "2003", "2005", "2000"],
["2005", "2002", "2003", "2004"],
["1996 год", "1997 год", "1998 год", "1995 год"],
["1999", "2000", "1998", "1997"],
["В реставрационном", "В художественном", "В музыкальном", "В столярном"]]


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
	elif question_number == 10:
		$"%finish".show()
		$"%finish/%much_raund_finish".text = str(Global.hronika_items)
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
		Global.hronika_items += 1
		get_node("%menu_panel2/%much_raund").text = str(Global.hronika_items)
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
		Global.hronika_items += 1
		get_node("%menu_panel2/%much_raund").text = str(Global.hronika_items)
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
		Global.hronika_items += 1
		get_node("%menu_panel2/%much_raund").text = str(Global.hronika_items)
	elif question_answer != 3:
		$"%answ_3".modulate = Color("#ff0000")
		yield(get_tree().create_timer(0.1), "timeout")
		$"%answ_3".modulate = Color("#ffffff")
	question_def = false


func _on_answ_4_pressed():
	if question_answer == 4:
		$moneta.play()
		get_node("%menu_panel2/%much_max_anim2").play("min_10")
		$"%answ_4".modulate = Color("#228b22")
		yield(get_tree().create_timer(0.1), "timeout")
		$"%answ_4".modulate = Color("#ffffff")
		Global.hronika_items += 1
		get_node("%menu_panel2/%much_raund").text = str(Global.hronika_items)
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
		Global.summ_items += Global.hronika_items
		get_tree().change_scene("res://scenes/main.tscn")
