extends Node

var burn_status_resource = preload("res://BurnStatus.gd")
var parent

func _ready():
	parent = get_node("..")
	parent.add_status("burn", burn_status_resource.new("burn", parent, 10))
	parent.add_status("base_speed", NumericalStatus.new("base_speed", parent, "base", parent.speed_effects))


#func _input(event):
	#parent.stasuses["first"].timer.start(1.0)