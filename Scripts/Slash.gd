extends Area2D
class_name Dismantle
signal dmgTrigger
var direction
export var speed=50
func _physics_process(delta):
	var direction= Vector2.RIGHT.rotated(rotation)
	global_position+=speed*direction*delta
	if scale>=Vector2(1.1,1.1):
		$CollisionPolygon2D.disabled=false
func _on_TravelTimer_timeout():
	if scale>=Vector2(2.2,2.2):
		queue_free()
	scale+=Vector2(0.1,0.1)


func _on_Slash_body_entered(body):
	emit_signal("dmgTrigger")
	queue_free()
