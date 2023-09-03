extends CanvasLayer

class_name SpellDescription


func showSpellDescription(spell_name, texture, description):
	$"Spell discription/New spell".play()
	$"Spell discription".show()
	$"Spell discription/Panel/Spell name".text = spell_name
	$"Spell discription/Panel/Spell texture".texture = texture
	$"Spell discription/Panel/Description".text = description


func closeDescription():
	$"Spell discription".hide()
