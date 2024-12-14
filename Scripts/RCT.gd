extends TextureProgress

signal passValue(val)
signal emptyRCT
signal availableRCT
func _on_Gojo_redShot():
	value-=10
	self.emit_signal("passValue",20)
	if value<10:
		emit_signal("emptyRCT")

func _on_CT_passValue(val):
	value+=val
	if value>=10:
		emit_signal("availableRCT")
