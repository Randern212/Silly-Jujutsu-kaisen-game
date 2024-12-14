extends Sprite

var goATK= load("res://Assets/Sprites/GOATK.png")
var goDefault = load("res://Assets/Sprites/GOJO.png")
func performAtk(pos):
	var lookingLeft:bool
	set_texture(goATK)
	if pos.direction_to(get_global_mouse_position()).normalized().x>=0:
		flip_h=true
		lookingLeft=false
	elif pos.direction_to(get_global_mouse_position()).normalized().x<=0:
		flip_h=false
		lookingLeft=true
	scale.x*=1.9
	scale.y*=1.9
	$StanceTimer.start(0.4)
	return lookingLeft
func backtodef():
	set_texture(goDefault)
	scale.x=scale.x/1.9
	scale.y=scale.y/1.9

func _on_StanceTimer_timeout():
	$StanceTimer.stop()
	backtodef()
