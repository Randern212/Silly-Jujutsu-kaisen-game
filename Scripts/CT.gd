extends TextureProgress

signal passValue(val)
signal emptyCT
signal availableCT
func _on_Gojo_blueShot():
	value-=10
	emit_signal("passValue",20)
	if value<10:
		emit_signal("emptyCT")

func _on_RCT_passValue(val):
	value+=val
	if value>=10:
		emit_signal("availableCT")
