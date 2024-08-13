extends Node2D

	#Player1
@onready var Player1A = get_node("Player1/Player1A")
var Player1ANumberValue = 1
@onready var Player1B = get_node("Player1/Player1B")
var Player1BNumberValue = 1
var Player1Turn = true
@onready var Player1TurnIndicator = get_node("Player1/TurnIndicator")

	#Player2
@onready var Player2A = get_node("Player2/Player2A")
var Player2ANumberValue = 1
@onready var Player2B = get_node("Player2/Player2B")
var Player2BNumberValue = 1
var Player2Turn = false
@onready var Player2TurnIndicator = get_node("Player2/TurnIndicator")

	#DirectionalArrow 
@onready var animation = get_node("DirectionalArrow/AnimationPlayer")

	#Timers
@onready var GCDTimer = get_node("GCDTimer")

# Called when the node enters the scene tree for the first time.
func _ready():
	Player1A.text = str(Player1ANumberValue)
	Player1B.text = str(Player1BNumberValue)
	Player2A.text = str(Player2ANumberValue)
	Player2B.text = str(Player2BNumberValue)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GCDTimer.is_stopped():
	#player 1 inputs
		if Input.is_action_pressed("1ATo2A") && Player1Turn == true:
			GCDTimer.start()
			print("1ATo2A")
			if Player1ANumberValue && Player2ANumberValue > 0 :
				Player2ANumberValue += Player1ANumberValue
				if Player2ANumberValue >= 5:
					Player2ANumberValue = 0
					print("2A reset to 0")
				print("Player2ANumberValue:", Player2ANumberValue)
				Player2A.text = str(Player2ANumberValue)
				animation.play("1ATo2A Glow")
				Player1Turn = false
				Player2Turn = true
			else:
				animation.play("1ATo2A Error")
				print("1ATo2A Failed")
				pass
		if Input.is_action_pressed("1ATo2B") && Player1Turn == true:
			GCDTimer.start()
			print("1ATo2B")
			if Player1ANumberValue && Player2BNumberValue > 0:
				Player2BNumberValue += Player1ANumberValue
				if Player2BNumberValue >= 5:
					Player2BNumberValue = 0
					print("2B reset to 0")
				print("Player2BNumberValue:", Player2BNumberValue)
				Player2B.text = str(Player2BNumberValue)
				animation.play("1ATo2B Glow")
				Player1Turn = false
				Player2Turn = true
			else:
				animation.play("1ATo2B Error")
				print("1ATo2B Failed")
				pass
		if Input.is_action_pressed("1ATo1B") && Player1Turn == true:
			GCDTimer.start()
			print("1ATo1B")
			if Player1ANumberValue > 0 && Player1ANumberValue < 4:
				Player1BNumberValue += 1
				Player1ANumberValue -= 1
				print("Player1ANumberValue:", Player1ANumberValue)
				Player1A.text = str(Player1ANumberValue)
				print("Player1BNumberValue:", Player1BNumberValue)
				Player1B.text = str(Player1BNumberValue)
				animation.play("1ATo1B Glow")
				Player1Turn = false
				Player2Turn = true
			else:
				animation.play("1ATo1B Error")
				print("1ATo1B Failed")
				pass
		if Input.is_action_pressed("1BTo2B") && Player1Turn == true:
			GCDTimer.start()
			print("1BTo2B")
			if Player1BNumberValue && Player2BNumberValue > 0:
				Player2BNumberValue += Player1BNumberValue
				if Player2BNumberValue >= 5:
					Player2BNumberValue = 0
					print("2B reset to 0")
				print("Player2BNumberValue:", Player2BNumberValue)
				Player2B.text = str(Player2BNumberValue)
				animation.play("1BTo2B Glow")
				Player1Turn = false
				Player2Turn = true
				pass
			else:
				animation.play("1BTo2B Error")
				print("1BTo2B Failed")
				pass
		if Input.is_action_pressed("1BTo2A") && Player1Turn == true:
			GCDTimer.start()
			print("1BTo2A")
			if Player1BNumberValue && Player2ANumberValue > 0:
				Player2ANumberValue += Player1BNumberValue
				if Player2ANumberValue >= 5:
					Player2ANumberValue = 0
					print("2A reset to 0")
				print("Player2ANumberValue:", Player2ANumberValue)
				Player2A.text = str(Player2ANumberValue)
				animation.play("1BTo2A Glow")
				Player1Turn = false
				Player2Turn = true
				pass
			else:
				animation.play("1BTo2A Error")
				print("1BTo2A Failed")
				pass
		if Input.is_action_pressed("1BTo1A") && Player1Turn == true:
			GCDTimer.start()
			print("1BTo1A")
			if Player1BNumberValue > 0 && Player1BNumberValue < 4:
				Player1ANumberValue += 1
				Player1BNumberValue -= 1
				print("Player1BNumberValue:", Player1BNumberValue)
				Player1B.text = str(Player1BNumberValue)
				print("Player1ANumberValue:", Player1ANumberValue)
				Player1A.text = str(Player1ANumberValue)
				animation.play("1BTo1A Glow")
				Player1Turn = false
				Player2Turn = true
			else:
				animation.play("1BTo1A Error")
				print("1ATo1B Failed")
				pass
	#player 2 inputs
		if Input.is_action_pressed("2ATo1A") && Player2Turn == true:
			GCDTimer.start()
			print("2ATo1A")
			if Player2ANumberValue && Player1ANumberValue > 0 :
				Player1ANumberValue += Player2ANumberValue
				if Player1ANumberValue >= 5:
					Player1ANumberValue = 0
					print("1A reset to 0")
				print("Player1ANumberValue:", Player1ANumberValue)
				Player1A.text = str(Player1ANumberValue)
				#animation.play("2ATo1A Glow")
				Player1Turn = true
				Player2Turn = false
			else:
				#animation.play("1ATo2A Error")
				print("2ATo1A Failed")
				pass
		if Input.is_action_pressed("2ATo1B") && Player2Turn == true:
			GCDTimer.start()
			print("2ATo1B")
			if Player2ANumberValue && Player1BNumberValue > 0:
				Player1BNumberValue += Player2ANumberValue
				if Player1BNumberValue >= 5:
					Player1BNumberValue = 0
					print("1B reset to 0")
				print("Player1BNumberValue:", Player1BNumberValue)
				Player1B.text = str(Player1BNumberValue)
				#animation.play("2ATo1B Glow")
				Player1Turn = true
				Player2Turn = false
			else:
				#animation.play("2ATo1B Error")
				print("2ATo1B Failed")
				pass
		if Input.is_action_pressed("2ATo2B") && Player2Turn == true:
			GCDTimer.start()
			print("2ATo2B")
			if Player2ANumberValue > 0 && Player2ANumberValue < 4:
				Player2BNumberValue += 1
				Player2ANumberValue -= 1
				print("Player2ANumberValue:", Player2ANumberValue)
				Player2A.text = str(Player2ANumberValue)
				print("Player2BNumberValue:", Player2BNumberValue)
				Player2B.text = str(Player2BNumberValue)
				#animation.play("2ATo2B Glow")
				Player1Turn = true
				Player2Turn = false
			else:
				#animation.play("2ATo2B Error")
				print("2ATo2B Failed")
				pass
		if Input.is_action_pressed("2BTo1B") && Player2Turn == true:
			GCDTimer.start()
			print("2BTo1B")
			if Player2BNumberValue && Player1BNumberValue > 0:
				Player1BNumberValue += Player2BNumberValue
				if Player1BNumberValue >= 5:
					Player1BNumberValue = 0
					print("1B reset to 0")
				print("Player1BNumberValue:", Player1BNumberValue)
				Player1B.text = str(Player1BNumberValue)
				#animation.play("2BTo1B Glow")
				Player1Turn = true
				Player2Turn = false
				pass
			else:
				#animation.play("2BTo1B Error")
				print("2BTo1B Failed")
				pass
		if Input.is_action_pressed("2BTo1A") && Player2Turn == true:
			GCDTimer.start()
			print("2BTo1A")
			if Player2BNumberValue && Player1ANumberValue > 0:
				Player1ANumberValue += Player2BNumberValue
				if Player1ANumberValue >= 5:
					Player1ANumberValue = 0
					print("1A reset to 0")
				print("Player1ANumberValue:", Player1ANumberValue)
				Player1A.text = str(Player1ANumberValue)
				#animation.play("2BTo1A Glow")
				Player1Turn = true
				Player2Turn = false
				pass
			else:
				#animation.play("2BTo1A Error")
				print("2BTo1A Failed")
				pass
		if Input.is_action_pressed("2BTo2A") && Player2Turn == true:
			GCDTimer.start()
			print("2BTo2A")
			if Player2BNumberValue > 0 && Player2ANumberValue < 4:
				Player2ANumberValue += 1
				Player2BNumberValue -= 1
				print("Player2BNumberValue:", Player2BNumberValue)
				Player2B.text = str(Player2BNumberValue)
				print("Player1ANumberValue:", Player2ANumberValue)
				Player2A.text = str(Player2ANumberValue)
				animation.play("2BTo2A Glow")
				Player1Turn = true
				Player2Turn = false
			else:
				animation.play("2BTo2A Error")
				print("2ATo2B Failed")
				pass
	#reset
	else:
		#print("GCDTimer:", GCDTimer.get_time_left())
		pass
	if Player1Turn == true && Player1TurnIndicator.visible == false:
		#print("Player1 turn")
		Player1TurnIndicator.visible = true
		Player2TurnIndicator.visible = false
	elif Player2Turn == true && Player2TurnIndicator.visible == false:
		#print("Player2 turn")
		Player2TurnIndicator.visible = true
		Player1TurnIndicator.visible = false
	pass
