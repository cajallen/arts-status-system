extends Status
class_name EchoStatus

func _init(args).(args):
	args["target"].connect("process_signal", self, "_process")

func _process(delta):
	pass