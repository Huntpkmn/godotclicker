@tool
extends TextureButton

signal clicked
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_pressed() -> void:
	const time = 0.125
	var t = get_tree().create_tween()
	t.tween_property($Sprite2D, "scale", Vector2.ONE*1.25, time/2)

	t.chain().tween_property($Sprite2D, "scale", Vector2.ONE, time/2)
	t.play()
	emit_signal("clicked")
