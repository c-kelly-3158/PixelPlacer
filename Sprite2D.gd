extends Sprite2D

@onready var animator = $AnimationPlayer
var mouseOver = false
var currentColor = "None"

func _ready():
	animator.play("NoPixel")
	self.modulate.a = 0

func _on_area_2d_mouse_entered():
	mouseOver = true
	if currentColor == "None":
		self.modulate.a = 0.5



func _on_area_2d_mouse_exited():
	mouseOver = false
	if currentColor == "None":
		self.modulate.a = 0
	
func _physics_process(delta):
	if Input.is_action_just_pressed("left_click") and mouseOver:
		print("clicked")
		self.modulate.a = 1
		
		if currentColor == "None":
			currentColor = "White"
			animator.play("WhitePixel")
		elif currentColor == "White":
			currentColor = "Green"
			animator.play("GreenPixel")
		elif currentColor == "Green":
			currentColor = "Pink"
			animator.play("PinkPixel")
		elif currentColor == "Pink":
			currentColor = "Yellow"
			animator.play("YellowPixel")
		elif currentColor == "Yellow":
			currentColor = "None"
			animator.play("NoPixel")
			self.modulate.a = 0.5


func _on_node_2d_hide_for_screen_shot():
	if currentColor == "None" and mouseOver:
		self.modulate.a = 0
		await get_tree().create_timer(0.05).timeout
		if currentColor == "None" and mouseOver:
			self.modulate.a = 0.5
