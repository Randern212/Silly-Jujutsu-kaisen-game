extends Area2D
class_name Blueballs
var target
var stoppedPosition:Vector2
export var speed:float=300
var isFired = false
signal Murasaki(pos)
func _physics_process(delta):
	if not isFired:
		var direction= Vector2.RIGHT.rotated(rotation)
		self.global_position+=speed*direction*delta
	else:
		self.global_position=stoppedPosition
func BlueShit():
	isFired=true
	gravity=400
	$HoverTime.start(3)

func _on_HoverTime_timeout():
	queue_free()

func _on_BT_timeout():
	$BlueBallSprite.scale-=Vector2(0.005,0.005)
	if $BlueBallSprite.scale<=Vector2(0.02,0.02):
		$BT.stop()
		stoppedPosition=global_position
		BlueShit()

func _on_PurpleZone_area_entered(area):
	emit_signal("Murasaki",self.global_position)
	area.queue_free()
	queue_free()
