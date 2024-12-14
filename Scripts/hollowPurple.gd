extends Area2D
signal dmgTrigger(amt)

func _ready():
	$AnimationPlayer.current_animation="Overlap"

func _on_hollowPurple_body_entered(body):
	emit_signal("dmgTrigger",35)

func _on_AnimationPlayer_animation_finished(anim_name):
	visible=false
