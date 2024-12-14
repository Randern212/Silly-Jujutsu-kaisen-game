extends RigidBody2D
class_name Sukuna
signal dmgGojo(amt)
export (PackedScene) var slash
export(PackedScene) var Fuga
export var dismantleCounter=0
var speed =300.0
var dir=Vector2.RIGHT
var player

func _physics_process(delta):
	if player!=null:
		if global_position.direction_to(player.global_position).normalized().x >= 0:
			dir.x=Vector2.RIGHT.x
		elif global_position.direction_to(player.global_position).normalized().x <= 0:
			dir.x=Vector2.LEFT.x
		if global_position.direction_to(player.global_position).normalized().y >= 0:
			dir.y=Vector2.DOWN.y
		elif global_position.direction_to(player.global_position).normalized().y <= 0:
			dir.y=Vector2.UP.y
	position+=speed*dir.normalized()*delta
	position.x=clamp(position.x,0,get_viewport_rect().size.x)
	position.y= clamp(position.y,0,get_viewport_rect().size.y)
func _on_AtkTimer_timeout():
	if dismantleCounter<=1:
		dismantleUnleash()
	else:
		fugaUnleash()
func _on_Slash_dmgTrigger():
	emit_signal("dmgGojo",15)

func dismantleUnleash():
	var dismantle = slash.instance()
	get_parent().add_child(dismantle)
	dismantle.global_position=self.global_position+Vector2(-19,-23)
	dismantle.rotation=self.global_position.direction_to(player.global_position).angle()
	var vanishingPoint= self.global_position.distance_to(player.global_position)
	dismantle.speed=vanishingPoint
	dismantle.connect("dmgTrigger",self,"_on_Slash_dmgTrigger")
	dismantleCounter+=1

func fugaUnleash():
	var flameArrow=Fuga.instance()
	get_parent().add_child(flameArrow)
	flameArrow.global_position=self.global_position+Vector2(-19,-23)
	flameArrow.rotation=self.global_position.direction_to(player.global_position).angle()
	var vanishingPoint= self.global_position.distance_to(player.global_position)
	flameArrow.speed=vanishingPoint
	flameArrow.connect("dmgTrigger",self,"_on_Fuga_dmgTrigger")
	dismantleCounter=0

func _on_Fuga_dmgTrigger():
	emit_signal("dmgGojo",40)
	
func _on_GoHP_go_jo():
	player=null
