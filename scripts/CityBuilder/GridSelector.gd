extends TileMap

var building; 		 			# Building scene that will be placed on the grid
var buildingTileIndex = 12;		# Index of the building tile in the tileset
var buildings = {};  			# Dictionary that maps tile position to building node
var currentlySelectedTilePos = null;	# The pos of the currently selected building

func _ready():
	building = preload("res://scenes/CityBuilder/building.tscn")

func _process(delta):
	var tilePosUnderMouse = world_to_map(get_global_mouse_position())
	
	# Move the highlight over the tile the cursor is hovering over
	get_node("/root/Node2D/Highlight").set_position(map_to_world(tilePosUnderMouse))
	
	# If the user left clicks, place the building
	if Input.is_action_just_pressed("ui_select"):
		if tilePosUnderMouse in buildings:
			_toggleSelectBuilding(tilePosUnderMouse)
		else:
			_deselectBuilding()
			_createBuilding(tilePosUnderMouse)
	
	
"""
Selects a building and displays info about it onscreen.

Arguments:
	- tilePos: a Vector2 representing the world position of a tile containing
			   the building.
"""
func _toggleSelectBuilding(tilePos):
	if !tilePos in buildings:
		print("error: no building to be selected at position", tilePos)
		return

	# If this building is not the one that was currently selected, select it
	if tilePos != currentlySelectedTilePos: 
		buildings[tilePos].get_node("Radius").visible = true;
		_deselectBuilding()  # Deselect any previously selected buildings
		currentlySelectedTilePos = tilePos
		
	# If the building is the same as the one currently selected, deselect it
	else: 
		_deselectBuilding()


"""
Deselects the currently selected building, removing information about the building from onscreen.
"""
func _deselectBuilding():
	if currentlySelectedTilePos != null and currentlySelectedTilePos in buildings:
		buildings[currentlySelectedTilePos].get_node("Radius").visible = false;
		currentlySelectedTilePos = null;


""" 
Creates a building at the given tile position if there isn't a one there already.

Arguments:
	- tilePos: a Vector2 representing the world position of the tile where the
			   building will be created.
"""
func _createBuilding(tilePos):
	if tilePos in buildings:
		print("error: building already exists at position", tilePos)
		return
		
	print("place at ", tilePos)
	set_cellv(tilePos, buildingTileIndex)
	buildings[tilePos] = building.instance()
	add_child(buildings[tilePos])
	buildings[tilePos].set_position(map_to_world(tilePos))

