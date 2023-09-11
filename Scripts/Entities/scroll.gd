extends Area2D

class_name Scroll

@export var spell_texture : Texture
@export var spell_name = ""
@export var description = ""


func _ready():
	$Spell.texture = spell_texture


func _on_body_entered(body):
	if body is Mark:
		GameStats.showSpellDescription(spell_name.to_upper(), spell_texture, description)
		GameStats.opened_spells.append(spell_name)
		queue_free()
