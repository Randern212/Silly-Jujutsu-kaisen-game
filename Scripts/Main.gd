extends Node2D

func _ready():
	$Sukuna.player=$Gojo

func _on_GoHP_go_jo():
	$Sukuna/AtkTimer.stop()
	$Gojo.queue_free()

func _on_SuHp_frauduna():
	$Sukuna.queue_free()
	$SuHp.queue_free()

func _on_Gojo_MurasakiATK(pos):
	if not $hollowPurple.visible:
		$hollowPurple.visible= true
		$hollowPurple.position=pos
		$hollowPurple/AnimationPlayer.play("Overlap")
		$RCT.value-=20
		$CT.value-=20
