extends TileMap

var tile_data
var spike = false


func _process(delta):	
	if tile_data:
		spike = tile_data.get_custom_data("is_spike")
	else:
		spike = false
	
	if !GameStats.mark_position == Vector2.ZERO:
		tile_data = get_cell_tile_data(1, GameStats.mark_position/32 as Vector2i)
	
	if spike:
		GameStats.takeDamage(240)
