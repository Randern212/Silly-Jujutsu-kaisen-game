extends Area2D
class_name Redballs

signal dmgTrigger(amt)
export var speed:float = 300
func _on_TravelTimer_timeout():
	$RedBallSprite.scale-=Vector2(0.005,0.005)
	if $RedBallSprite.scale<=Vector2(0.005,0.005):
		queue_free()

func _physics_process(delta):
	var direction= Vector2.RIGHT.rotated(rotation)
	self.global_position+=speed*direction*delta
	if $RedBallSprite.scale<=Vector2(0.020,0.020):
		$RedBallShape.disabled=false

func _on_RedBall_body_entered(body):
	emit_signal("dmgTrigger",10)
	queue_free()
