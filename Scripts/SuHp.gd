extends TextureProgress

signal frauduna

func _on_Gojo_dmgSukuna(amt):
	value-=amt
	if value<=0:
		emit_signal("frauduna")
