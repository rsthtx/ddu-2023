extends Area2D

@export var direction = Vector2.RIGHT
@export var speed : float = 50.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * delta * speed


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("obstacle"):
		speed = 0
	

func _on_area_exited(area: Area2D) -> void:
	print("exited")
	if area.is_in_group("obstacle"):
		print("obstacle exited")
		speed = 50.0
