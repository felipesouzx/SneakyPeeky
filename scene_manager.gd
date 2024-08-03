extends Node2D


@export var default_scene: PackedScene


func _ready() -> void:
	add_scene(default_scene)


func change_scene(scene_path: String) -> void:
	var scene_file: PackedScene = load(scene_path)
	await remove_scene().tree_exited
	add_scene(scene_file)


func remove_scene() -> Node2D:
	var current_scene: Node2D = get_child(0)
	current_scene.queue_free()
	return current_scene


func add_scene(scene_file: PackedScene) -> Node2D:
	var scene = scene_file.instantiate()
	self.add_child(scene)
	return scene
