extends TileMap

var tile_data
var spike = false


func _process(delta):	
	if tile_data:
		spike = tile_data.get_custom_data("is_spike")
	else:
		spike = false
	
	if !GameStats.mark_position == Vector2.ZERO:
		var player = local_to_map(GameStats.mark_position / 0.063)
		
		print(player)
		
		tile_data = get_cell_tile_data(1, player)
	
	if spike:
		GameStats.takeDamage(240)
