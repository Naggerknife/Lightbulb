extends Light2D

onready var _fadeTimer = $Timer
var roundTimer = 30

var currentTime = 0
var fadeAmount = 0
var currentScale

var isRecharging = false

func _ready():
	#Fade Timer
	_fadeTimer.wait_time = 1
	_fadeTimer.one_shot = false
	_fadeTimer.connect("timeout", self, "_on_timer_timeout")
	_fadeTimer.start()
	
	fadeAmount = self.texture_scale / roundTimer
	currentScale = self.texture_scale
	
	get_node("/root/World/RechargePoint").connect("body_entered", self, "on_recharge")
	
func _on_timer_timeout():
	self.texture_scale = max(0, self.texture_scale - fadeAmount)
	
func RechargeLight(amount):
	self.texture_scale = min(currentScale, self.texture_scale + amount)
	
func on_recharge():
	print('recharging!')
	
