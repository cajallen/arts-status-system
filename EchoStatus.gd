extends Status
class_name EchoStatus

func _init(_id, _target, time = null, _max_stacks = 1, _one_shot = false, _icon = null, _description = null).(_id, _target, time, _max_stacks, _one_shot, _icon, _description):
	target.connect("process_signal", self, "_process")

func _process(delta):
	pass