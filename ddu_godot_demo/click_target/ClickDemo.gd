extends Node2D
@onready var mover: Sprite2D = $Mover

func _ready() -> void:
	var targets = [$ClickTarget, $ClickTarget2, $ClickTarget3]
	
	for t in targets:
		t.pressed.connect(_on_click_target_pressed)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("press anything")


func _on_click_target_pressed(pos) -> void:
#	$Mover.position = pos
	var movement_done = func (): print("Movement towards ", pos, " done!")

	create_tween() \
		.tween_property(mover,"position", pos, 2.0) \
		.set_trans(Tween.TRANS_ELASTIC) \
		.set_ease(Tween.EASE_OUT) \
		.finished.connect(movement_done)
		
