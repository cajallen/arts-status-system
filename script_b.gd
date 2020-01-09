extends Node

var parent

func _ready():
	parent = get_node("..")
	parent.add_status("burn", DOTStatus.new({ "id": "burn", "target": parent, "dps": 10, "time": 2.0 }))
	parent.add_status("base_speed", NumericalStatus.new({ "id": "base_speed", "target": parent, "type": "base", "value": 100, "effects_dict": parent.speed_effects }))


func _input(event):
	parent.statuses["burn"].timer.start(1.0)