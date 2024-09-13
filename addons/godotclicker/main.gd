@tool
extends Control
@onready var label =$HBoxContainer/PanelContainer/Panel/Label
var dockSize : Vector2
var data : _CookieData


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if data == null:
		data = preload("res://addons/godotclicker/Save.tres")
	update_godots()
	update_nodes()
	update_clickers()
	update_label()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_clicker_clicked() -> void:
	data.bits += 1
	update_label()

func update_label():
	label.set_text("Bits:\n"+str(data.bits))

func update_clickers():
	$HBoxContainer/ScrollContainer2/VBoxContainer/ClickersBut.set_text(str(data.clicker)+"|Buy Clickers: " + str(50+25 * data.clicker/2))

func update_nodes():
	$HBoxContainer/ScrollContainer2/VBoxContainer/NodesBut.set_text(str(data.node)+"|Buy Nodes: " + str(200+50 * data.node/2))

func update_godots():
	$HBoxContainer/ScrollContainer2/VBoxContainer/GodotsBut.set_text(str(data.godots)+"|Buy Godots: " + str(500+100 * data.godots/2))

func _on_godots_but_pressed() -> void:
	if data.bits > 500+100 * data.godots/2:
		data.godots +=1
		data.bits -=500+100 * data.godots/2
		update_godots()


func _on_nodes_but_pressed() -> void:
	if data.bits > 200+50 * data.node/2:
		data.node +=1
		data.bits -=200+50 * data.node/2
		update_nodes()


func _on_clickers_but_pressed() -> void:
	if data.bits > 50+25 * data.clicker/2:
		data.clicker +=1
		data.bits -=50+25* data.clicker/2
		update_clickers()


func _on_timer_timeout() -> void:
	data.bits+= data.clicker
	data.bits+= 5*data.node
	data.bits += 25*data.godots
	update_label()
