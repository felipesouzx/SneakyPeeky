@icon("res://components/general/scene_changer.svg")
extends Node
class_name UIChanger


@export var scene_file: PackedScene


func change_ui() -> void:
	Requests.change_ui.emit(scene_file)
