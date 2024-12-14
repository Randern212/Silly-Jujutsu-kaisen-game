extends TextureProgress

signal go_jo
func _on_Sukuna_dmgGojo(amt):
	value-=amt
	if value<=0:
		emit_signal("go_jo")
