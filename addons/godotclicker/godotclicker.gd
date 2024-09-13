@tool
extends EditorPlugin

var dock
var save
func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	dock = preload("res://addons/godotclicker/main.tscn").instantiate()
	save = preload("res://addons/godotclicker/Save.tres")
	dock.data = save
	EditorInterface.get_editor_main_screen().add_child(dock)

	# Hide the main panel. Very much required.
	_make_visible(false)


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	ResourceSaver.save(save,"res://addons/godotclicker/Save.tres")
	if dock:
		dock.queue_free()
	pass


func _has_main_screen():
	return true

func _make_visible(visible):
	if dock:
		
		dock.visible = visible


func _get_plugin_name():
	return "Godot Clicker"


func _get_plugin_icon():
	# Must return some kind of Texture for the icon.
	return preload("res://addons/godotclicker/icon.svg")
