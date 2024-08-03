@icon("res://components/general/scene_changer.svg")
extends Node
class_name SceneChanger


@export var scene_file: PackedScene


func change_scene() -> void:
	Requests.change_scene.emit(scene_file)
