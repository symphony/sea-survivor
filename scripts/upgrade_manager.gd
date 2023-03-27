extends Node

@export var upgrade_pool: Array[AbilityUpgrade]
@export var experience_manager: ExperienceManager
@export var upgrade_screen_scene: PackedScene

var current_upgrades = {}

func _ready():
	experience_manager.level_up.connect(on_level_up)


func on_level_up(current_level: int):
	var chosen_upgrade = upgrade_pool.pick_random() as AbilityUpgrade
	if !chosen_upgrade: return

	var upgrade_screen_instance = upgrade_screen_scene.instantiate()
	add_child(upgrade_screen_instance)
	upgrade_screen_instance.set_ability_upgrades([chosen_upgrade] as Array[AbilityUpgrade])
	upgrade_screen_instance.upgrade_selected.connect(on_upgrade_selected)


func apply_upgrade(upgrade: AbilityUpgrade):
	var has_upgrade = upgrade.has(upgrade.id)
	if !has_upgrade:
		upgrade[upgrade.id] = {
			'resource': upgrade,
			'quantity': 1
		}
	else :
		upgrade[upgrade.id]["quantity"] += 1


func on_upgrade_selected(upgrade: AbilityUpgrade):
	apply_upgrade(upgrade)
