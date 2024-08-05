extends Node


@export var default_scene: PackedScene
@export var default_ui: PackedScene
@export var scene_container: Node2D
@export var ui_container: Control


func _ready() -> void:
	Requests.change_scene.connect(change_scene.bind(scene_container))
	Requests.change_ui.connect(change_scene.bind(ui_container))
	_add_scene(default_scene, scene_container)
	_add_scene(default_ui, ui_container)



func change_scene(scene_file: PackedScene, target = self) -> void:
	var old_scene = _remove_scene(target)
	if is_instance_valid(old_scene):
		await old_scene.tree_exited
	if scene_file:
		_add_scene(scene_file, target)



func _remove_scene(target = self) -> Node:
	if target.get_child_count() == 0:
		return null
	
	var current_scene: Node = target.get_child(0)
	if not is_instance_valid(current_scene):
		return null
	
	current_scene.queue_free()
	return current_scene



func _add_scene(scene_file: PackedScene, target = self) -> Node:
	if not scene_file:
		return null
	
	var scene = scene_file.instantiate()
	target.add_child(scene)
	
	return scene

