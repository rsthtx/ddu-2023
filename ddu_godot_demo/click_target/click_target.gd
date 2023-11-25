extends Sprite2D
@onready var area_2d: Area2D = $Area2D

signal pressed(pos : Vector2)


func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("collision pressed")
		pressed.emit(position)
		
#		print(area_2d.global_position)
		
