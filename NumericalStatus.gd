extends Status
class_name NumericalStatus

var type
var value
var effects_dict

func _init(_id, _target, _type, _value, _effects_dict, time = null, _max_stacks = 1, _one_shot = false, _icon = null, _description = null).(_id, _target, time, _max_stacks, _one_shot, _icon, _description):
	type = _type
	value = _value
	effects_dict = _effects_dict

func add():
	effects_dict[id] = self
	.add()