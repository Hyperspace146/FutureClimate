extends TileMap

export var building_tile_index = 12		# Index of a building tile in the tileset
var mouse_hovering_UI = false			# True if mouse is over a UI element (disables building placement)

var _building 		 					# Building scene that will be placed on the grid
var _buildings = {}  					# Dictionary that maps tile position to building node
var _currently_selected_tile_pos = null	# The pos of the currently selected building

# Tile pos maps to a list of buildings whose radius includes that tile
var _tile_info = {}


"""
Returns the tile info for the specified tile, which is a list of buildings
whose radius includes that tile. An empty list is returned if there is no info
for that tile.

Arguments:
	- tile_pos: Vector2 representing the tile position whose info is returned
"""
func get_tile_info(tile_pos):
	return _tile_info[tile_pos] if tile_pos in _tile_info else []


"""
Sets the given node's position to the given tile position.

Arguments:
	- node: the node whose position will be set
	- tile_pos: Vector2 representing the tile position to be used
"""
func set_node_position_to_tile(node, tile_pos):
	node.set_global_position(map_to_world(tile_pos))


"""
Iterates over the circular radius at the given tile position and calls the given
function at each tile position.

Arguments:
	- tile_pos: Vector2 representing tile position
	- rad: the radius in tiles
	- function: a FuncRef function that takes a Vector2 tile_pos as argument
"""
func iterate_over_radius(tile_pos, rad, function: FuncRef):
	var cx = tile_pos[0]
	var cy = tile_pos[1]
	
	# Iterate over the square containing the radius
	for y in range(cy - rad, cy + rad + 1):
		for x in range(cx - rad, cx + rad + 1):
			var isInCircle = (x - cx) * (x - cx) + (y - cy) * (y - cy) < rad * rad;
			if isInCircle:
				function.call_func(Vector2(x, y))


func _ready():
	_building = preload("res://scenes/CityBuilder/Building.tscn")


func _process(delta):
	var tile_pos_under_mouse = world_to_map(get_global_mouse_position())
	$"/root/Node2D/CanvasLayer/TabContainer/City/TilePosLabel".text = String(tile_pos_under_mouse)
	
	# Move the highlight over the tile the cursor is hovering over
	$"/root/Node2D/TileHighlight".set_position(map_to_world(tile_pos_under_mouse))
	
	# If the user left clicks (and isn't hovering over a UI element), place, select, or deselect 
	# the building
	if Input.is_action_just_pressed("ui_select") and !mouse_hovering_UI:
		if tile_pos_under_mouse in _buildings:
			_toggle_select_building(tile_pos_under_mouse)
		else:
			_deselect_building()
			_create_building(tile_pos_under_mouse)
	
	
"""
Selects/deselects a currently placed building and displays info about it onscreen.

Arguments:
	- tilePos: a Vector2 representing the world position of a tile containing
			   the building.
"""
func _toggle_select_building(tile_pos):
	if !tile_pos in _buildings:
		print("error: no building to be selected at position", tile_pos)
		return

	# If this building is not the one that was currently selected, select it
	if tile_pos != _currently_selected_tile_pos: 
		_deselect_building()  # Deselect any previously selected buildings
		_currently_selected_tile_pos = tile_pos
		
	# If the building is the same as the one currently selected, deselect it
	else: 
		_deselect_building()


"""
Deselects the currently selected building, removing information about the building from onscreen.
"""
func _deselect_building():
	if _currently_selected_tile_pos != null and _currently_selected_tile_pos in _buildings:
		_buildings[_currently_selected_tile_pos].get_node("Radius").visible = false;
		_currently_selected_tile_pos = null;


""" 
Creates a building at the given tile position if there isn't a one there already.

Arguments:
	- tilePos: a Vector2 representing the world position of the tile where the
			   building will be created.
"""
func _create_building(tile_pos):
	if tile_pos in _buildings:
		print("error: building already exists at position", tile_pos)
		return
	
	# Create the building sprite and object at the given tile position
	set_cellv(tile_pos, building_tile_index)
	_buildings[tile_pos] = _building.instance()
	add_child(_buildings[tile_pos])
	set_node_position_to_tile(_buildings[tile_pos], tile_pos)
	_buildings[tile_pos].init(tile_pos)
	
	# Add this building to the tile info for tiles in this building's radius
	_add_building_to_tile_info(_buildings[tile_pos])
	

"""
Change the building to be placed upon clicking.

Arguments:
	- buildingTileIndex: an int representing the tile ID of the building in the tileset.
"""
func _change_building(building_tile_index):
	self.building_tile_index = building_tile_index


"""
Updates the tile info in the radius of the givev building node.

Arguments:
	- building: the building node whose info will be added to the surrounding tiles. 
"""
func _add_building_to_tile_info(building):
	var cx = building.tile_pos[0]
	var cy = building.tile_pos[1]
	var rad = building.radius
	
	# Iterate over the square containing the radius
	for y in range(cy - rad, cy + rad + 1):
		for x in range(cx - rad, cx + rad + 1):
			var isInCircle = (x - cx) * (x - cx) + (y - cy) * (y - cy) < rad * rad;
			if isInCircle:
				var tile_pos = Vector2(x, y)
				if !(tile_pos in _tile_info):
					_tile_info[tile_pos] = []
				_tile_info[tile_pos].append(building)


func _on_Button_pressed(building_tile_index):
	_change_building(building_tile_index)


func _on_Panel_mouse_entered():
	print("mouse not on UI")
	mouse_hovering_UI = false


func _on_Panel_mouse_exited():
	print("mouse on UI")
	mouse_hovering_UI = true
