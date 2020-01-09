extends Status
class_name NumericalStatus

var type
var value
var effects_dict

func _init(args).(args):
	type = args["type"]
	value = args["value"]
	effects_dict = args["effects_dict"]
	effects_dict[id] = self

func add():
	.add()

func remove():
	effects_dict.erase(id)
	.remove()