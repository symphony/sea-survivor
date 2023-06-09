class_name Bullet
extends Node2D

var speed = 200.0

@onready var hitbox_component: HitboxComponent = $HitboxComponent


# Called when the node enters the scene tree for the first time.
func _ready():
	$Lifetime.connect("timeout", on_lifetime_timeout)


func _process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * delta * speed


func on_lifetime_timeout():
	$AnimationPlayer.play("despawn")
