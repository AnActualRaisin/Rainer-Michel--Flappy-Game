extends CollisionShape2D

signal hit

func _on_body_entered(body):
	hit.emit()
