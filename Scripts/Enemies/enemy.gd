extends Flipping

class_name Enemy

@export var health = 50
@export var speed = 100
@export var damage_radius = 32
@export var damage = 10
@export var mortal = true
var neutralize = false
var bats
var bat
var bats_obj = []


func checkBats():
	bats = get_tree().get_nodes_in_group("bat")
	
	if bats.size() > 0:
		bat = bats[0]
		
		for i in bats:
			if position.distance_to(bat.position) > position.distance_to(i.position):
				bat = i
	
	bats_obj.clear()
	
	var chased_obj = $Chasing.get_overlapping_bodies()
	for i in chased_obj:
		if i is Bat:
			bats_obj.append(i)


func pushing():
	if mortal:
		$"Pushing sound".play()
		health -= 50 * (GameStats.level / 5 + 1)


func damaging(taking_damage):
	if mortal:
		$Damaged.play()
		health -= taking_damage * (GameStats.level / 5 + 1)
