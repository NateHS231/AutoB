extends Area2D

signal Strike
signal Dead

@onready var attackTimer = $"attack time"

var information = {
	'hp' : 6,
	'damage': 3,
	'attack_time': .6,
	'move_speed': 10,
}
var groovin = false

var foe
var foes = []
var strikingRange =[]

func _ready():
	attackTimer.one_shot = true
	attak_speed(information.attack_time)
	pass

func _process(delta):
	if groovin:
		if foe and foe not in strikingRange:
			move_self()
	pass

func move_self():
	self.position = self.position.move_toward(foe.position, 2)
	pass

func bind_self(battleground):
	Dead.connect(battleground.kill)
	pass

func attak_speed(zoom):
	$"attack time".set_wait_time(zoom)
	pass

func add_foes(totalFoes):
	for i in totalFoes:
		foes.append(i)
	foe = find_closest()
	groovin = true
	pass

func find_closest():
	var target
	if foes:
		target = foes.front()
		for i in foes:
			if self.position.distance_to(i.position) < self.position.distance_to(target.position):
				target = i
#		print('cos') 
	else:
		return null
	return target

func _on_area_shape_entered(_area_rid, area, _area_shape_index, _local_shape_index):
###########################################################################################
	if foe and foe == area:
		strikingRange.append(area)
		groovin = false
		hit()
		$"attack time".start()
	pass

func hit():
	if foe != null and strikingRange:
		foe.emit_signal('Strike',foe,self,information.damage)
	if foe == null:
		foe = find_closest()
	pass

func _on_strike(struk, striker, damage):
	if self == struk:
		information.hp -= damage
		
	if information.hp <= 0:
		emit_signal('Dead', self, striker)
	pass

func _on_attack_time_timeout():
	if foe:
		hit()
		$"attack time".start()
	pass

func target_new(deadTarget):
	foes.erase(deadTarget)
	strikingRange.erase(deadTarget)
	$"attack time".stop()
	foe = find_closest()
	groovin = true
	pass
