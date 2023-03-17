extends CanvasLayer

# variables/constants

const CHAR_READ_RATE = 0.1

onready var textbox_container = $TextboxContainer
onready var start_symbol = $TextboxContainer/MarginContainer/HBoxContainer/Start
onready var end_symbol = $TextboxContainer/MarginContainer/HBoxContainer/End
onready var label = $TextboxContainer/MarginContainer/HBoxContainer/Text

enum State {
	READY,
	READING,
	FINISHED
}

var current_state = State.READY
var text_queue = []

func _ready(): # function to hide textbox
	_hide_textbox()


func _process(delta): # process function
	if Global.is_on == true:
		if Input.is_action_just_pressed("ui_accept"):
			_text_queue("Vejo que você conseguiu com sucesso pegar as moedas e chegar ao final...")
			_text_queue("Achou que iria ganhar algo? Pois bem, achou errado, por qual motivo eu lhe daria algo apenas por pegar moedas?")
			_text_queue("Que isto sirva como um exemplo, a vida é cheia de decepções e este jogo é um exemplo de uma.")
			_text_queue("")
	
	match current_state:
		State.READY:
			if !text_queue.empty():
				_display_text()
		State.READING:
			if Input.is_action_just_pressed("ui_accept"):
				label.percent_visible = 1.0
				$Tween.stop_all()
				end_symbol.text = "v"
				_change_state(State.FINISHED)
		State.FINISHED:
			if Input.is_action_just_pressed("ui_accept"):
				_change_state(State.READY)
				_hide_textbox()

# functions

func _text_queue(next_text): # function to add text queue
	text_queue.push_back(next_text)
	

func _hide_textbox(): # function to hide textbox
	start_symbol.text = ""
	end_symbol.text = ""
	label.text = ""
	textbox_container.hide()

func _show_textbox(): # function to show textbox 
	start_symbol.text = "*"
	textbox_container.show() 

func _display_text(): # function to display the text
	var next_text = text_queue.pop_front()
	label.percent_visible = 0.0
	label.text = next_text
	_change_state(State.READING)
	_show_textbox()
	$Tween.interpolate_property(label, "percent_visible", 0.0, 1.0, len(next_text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()


# state functions

func _change_state(next_state): # function to change state
	current_state = next_state
	match current_state:
		State.READY:
			print("Changing state to State.READY")
		State.READING:
			print("Changing state to State.READING")
		State.FINISHED:
			print("Changing state to State.FINISHED")

# pre built functions

func _on_Tween_tween_all_completed(): # function so that when Tween is completed, adds V at end
	end_symbol.text = "v"
	_change_state(State.FINISHED)
