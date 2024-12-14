extends Area2D
class_name fuga
signal dmgTrigger
var direction
export var speed=80
func _physics_process(delta):
	var direction= Vector2.RIGHT.rotated(rotation)
	self.global_position+=speed*direction*delta
	if scale>=Vector2(6.2,6.2):
		$CollisionShape2D.disabled=false

func _on_TravelTimer_timeout():
	if scale>=Vector2(9.5,9.5):
		queue_free()
	scale+=Vector2(0.7,0.7)


func _on_fuga_body_entered(body):
	emit_signal("dmgTrigger")
	queue_free()
