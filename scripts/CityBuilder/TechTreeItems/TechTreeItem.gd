extends Button


export var tooltip = "No tooltip"
export var cost = -1


# Should be overridden in subclasses.
func item_effect():
	print("Error: item_effect() method not overridden.")

func unlock_children():
	for child in get_children():
		child.disabled = false


func _ready():
	set_process(true)
	
func _process(delta):
	update()
	
func _draw():
	_draw_lines_to_children()

func _draw_lines_to_children():
	# Draw from right-middle side of this button to the left-middle side of each child
	var from = self.rect_position + rect_size - Vector2(0, rect_size.y)
	for child in get_children():
		var to = child.rect_position# + Vector2(rect_size.y, 0)
		draw_line(from, to, Color.bisque, 3)
	
func _pressed():
	$"/root/Node2D/CanvasLayer/TabContainer/Tech"._select_tech(self)
	
	
