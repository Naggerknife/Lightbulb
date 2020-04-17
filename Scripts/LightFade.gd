extends Light2D

onready var _fadeTimer = $Timer
onready var _rechargeTimer = $Timer2

export var roundTimer = 5

var currentTime = 0
var fadeAmount = 0
var currentScale

var isRecharging = false
var canRecharge = false

# warning-ignore:unused_argument
func _process(delta):
	if isRecharging && _rechargeTimer.is_stopped():
		_rechargeTimer.start()
	elif !isRecharging:
		_rechargeTimer.stop()

func _ready():
	#Fade Timer
	_fadeTimer.wait_time = 1
	_fadeTimer.one_shot = false
	_fadeTimer.connect("timeout", self, "_on_timer_timeout")
	_fadeTimer.start()
	
	fadeAmount = self.texture_scale / roundTimer
	currentScale = self.texture_scale
	
	_rechargeTimer.wait_time = 1
	_rechargeTimer.one_shot = false
	_rechargeTimer.connect("timeout", self, "_recharge_timer_timeout")
	
func _on_timer_timeout():
	if !isRecharging:
		self.texture_scale = max(-.001, self.texture_scale - fadeAmount)
	
func _recharge_timer_timeout():
	RechargeLight(fadeAmount)
	
func RechargeLight(amount):
	self.texture_scale = min(self.texture_scale + (amount * 2), currentScale)
	
