extends RigidBody2D

var projectile_speed = 800

func _ready():
    apply_impulse(Vector2(projectile_speed, 0).rotated(rotation))