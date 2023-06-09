extends Node

@export_range(0, 1) var drop_percent := 1
@export var vial_multiplier := 1.0
@export var health_component: HealthComponent
@export var vial_scene: PackedScene


func _ready():
	health_component.died.connect(on_died)


func on_died():
	if vial_scene == null:
		return
	if not owner is Node2D:
		return
	if randf() > drop_percent:
		return

	var spawn_position = owner.global_position
	var vial_instance: Node2D = vial_scene.instantiate()
	var entities_layer = get_tree().get_first_node_in_group("entities_layer") as Node2D
	entities_layer.add_child(vial_instance)
	vial_instance.multiplier = vial_multiplier
	vial_instance.global_position = spawn_position
