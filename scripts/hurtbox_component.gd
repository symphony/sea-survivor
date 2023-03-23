extends Area2D
class_name HurtboxComponent

@export var health_component: HealthComponent


func _ready():
	area_entered.connect(on_area_entered)


func on_area_entered(hitbox_component: HitboxComponent):
	if not hitbox_component is HitboxComponent: return
	if !health_component: return

	health_component.damage(hitbox_component.damage)