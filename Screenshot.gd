extends Node2D

signal hideForScreenShot

var numberShot = 0

func _ready():
	DirAccess.make_dir_absolute(OS.get_system_dir(0) +"/PixelPicker")

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_viewport().set_transparent_background(true)
		hideForScreenShot.emit()
		await get_tree().create_timer(0.05).timeout
		while FileAccess.file_exists(OS.get_system_dir(0) +"/PixelPicker/"+ str(numberShot) + "screenShot.png"):
			if FileAccess.file_exists(OS.get_system_dir(0) +"/PixelPicker/"+ str(numberShot) + "screenShot.png"):
				numberShot += 1
		shoot_screen()
		#test

func shoot_screen():
	var img = get_viewport().get_texture().get_image()
	img.save_png(OS.get_system_dir(0) +"/PixelPicker/"+ str(numberShot) + "screenShot.png")
	get_viewport().set_transparent_background(false)
