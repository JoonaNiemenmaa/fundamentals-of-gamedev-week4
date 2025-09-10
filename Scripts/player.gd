class_name Player extends CharacterBody2D

@export var move_speed := 80
@export var jump_height := 80
var gravity := float(ProjectSettings.get_setting("physics/2d/default_gravity"))
@onready var animated_sprite := $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var move_x := Input.get_axis("LEFT", "RIGHT")

	velocity.x = move_x * move_speed

	if move_x > 0:
		animated_sprite.flip_h = true
	elif move_x < 0:
		animated_sprite.flip_h = false

	if move_x:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")

	if not is_on_floor():
		velocity.y += gravity * delta
	elif Input.is_action_just_pressed("JUMP"):
		velocity.y = -jump_height

	move_and_slide()
