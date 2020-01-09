extends EchoStatus

var dps

func _init(_id, _target, _dps, time = null, _max_stacks = 1, _one_shot = false, _icon = null, _description = null).(_id, _target, time, _max_stacks, _one_shot, _icon, _description):
	dps = _dps

func _process(delta):
	target.health -= dps * delta