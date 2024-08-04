extends Node


@export var change_scene_request: String = "change_scene"
@export var default_scene: PackedScene


func _ready() -> void:
	Requests.get(change_scene_request).connect(change_scene)
	add_scene(default_scene)


func change_scene(scene_file: PackedScene) -> void:
	var old_scene = remove_scene()
	if is_instance_valid(old_scene):
		await old_scene.tree_exited
	add_scene(scene_file)


func remove_scene() -> Node2D:
	if get_child_count() == 0:
		return null
	var current_scene: Node2D = get_child(0)
	if not is_instance_valid(current_scene):
		return null
	
	current_scene.queue_free()
	return current_scene


func add_scene(scene_file: PackedScene) -> Node2D:
	if not scene_file:
		return null
	
	var scene = scene_file.instantiate()
	self.add_child(scene)
	return scene

