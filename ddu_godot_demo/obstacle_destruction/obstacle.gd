extends Area2D
@onready var timer: Timer = $Timer

func _on_area_entered(area: Area2D) -> void:
	print("obstactle was hit")

	if area.is_in_group("player"):
		print("hit by player")
		# start decreasing health
		timer.start()

var health = 3
func _on_timer_timeout() -> void:
	health -= 1
	if health < 0:
		queue_free()
