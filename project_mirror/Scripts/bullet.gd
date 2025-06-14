class_name Bullet extends Area2D


var speed = 750

func _physics_process(delta):
	position -= transform.y * speed * delta

func _on_Bullet_body_entered(body):
	queue_free()
