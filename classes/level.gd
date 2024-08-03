@icon("res://classes/level.svg")
@tool
extends Node2D
class_name Level


var preset_nodes: Array = [
	{
		"name": "Objects",
		"type": Node2D,
		"calls": { "add_to_group": ["objects", true] },
	}
]


func _ready() -> void:
	for node_data in preset_nodes:
		if self.has_node(node_data.name):
			continue
		
		var new_node: Node = node_data.type.new()
		self.add_child(new_node)
		new_node.set_owner(self)
		
		new_node.set_name(node_data.name)
		
		for method in node_data.calls:
			var args: Array = node_data.calls[method]
			new_node.callv(method, args)







