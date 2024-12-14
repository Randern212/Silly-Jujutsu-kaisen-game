extends KinematicBody2D
class_name Gojo
var speed =580.0
var dir=Vector2.ZERO
var isATK = false
var redReady = true
var blueReady = true
var bullet
export (PackedScene)  var RED
export (PackedScene)  var BLUE
signal redShot
signal blueShot
signal infiniteVoid
signal MurasakiATK(pos)
signal dmgSukuna(amt)
func _input(event):
	if event.is_action_pressed("shoot") and not isATK and RED and redReady:
		emit_signal("redShot")
		createBullet(RED,"dmgTrigger","_on_dmgTrigger")
	if event.is_action_pressed("Blue") and not isATK and BLUE and blueReady:
		emit_signal("blueShot")
		createBullet(BLUE,"Murasaki","_on_Murasaki")
	if event.is_action_pressed("ui_accept") and redReady and blueReady:
		emit_signal("infiniteVoid")

func _process(delta):
	if not isATK:
		if Input.is_action_pressed("ui_up"):
			dir.y=-1.0
		elif Input.is_action_pressed("ui_down"):
			dir.y=1.0
		elif Input.is_action_pressed("ui_left"):
			dir.x=-1.0
		elif Input.is_action_pressed("ui_right"):
			dir.x=1.0
		else:
			dir=Vector2.ZERO
		position +=dir.normalized()*speed*delta
	if position.x<=get_viewport_rect().size.x/2 and not isATK:
		$GoSprite.flip_h=true
	elif position.x>=get_viewport_rect().size.x/2 and not isATK:
		$GoSprite.flip_h=false
	position.x=clamp(position.x,0,get_viewport_rect().size.x)
	position.y= clamp(position.y,0,get_viewport_rect().size.y)
func _on_StanceTimer_timeout():
	isATK= false

func _on_dmgTrigger(amt):
	emit_signal("dmgSukuna",amt)

func _on_RCT_emptyRCT():
	redReady=false

func _on_RCT_availableRCT():
	redReady=true

func _on_CT_emptyCT():
	blueReady=false

func _on_CT_availableCT():
	blueReady=true

func _on_Murasaki(pos):
	emit_signal("MurasakiATK",pos)

func _on_hollowPurple_dmgTrigger(amt):
	emit_signal("dmgSukuna",amt)

func createBullet(pack,signalTarget,signalFunc):
	var lookingLeft=$GoSprite.performAtk(self.global_position)
	isATK = true
	bullet = pack.instance()
	get_parent().add_child(bullet)
	bullet.connect(signalTarget,self,signalFunc)
	if not lookingLeft:
		bullet.global_position=self.global_position+Vector2(64,-90)
	else:
		bullet.global_position=self.global_position+Vector2(-64,-90)
	var bulletRotation = self.global_position.direction_to(get_global_mouse_position()).angle()
	bullet.rotation=bulletRotation
	var vanishingPoint= self.global_position.distance_to(get_global_mouse_position())
	bullet.speed=vanishingPoint
