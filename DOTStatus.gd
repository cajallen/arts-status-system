extends EchoStatus
class_name DOTStatus

var dps

func _init(args).(args):
	dps = args["dps"]

func _process(delta):
	target.health -= dps * delta