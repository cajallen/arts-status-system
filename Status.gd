extends Resource
class_name Status


var stacks = 0

var id
var target
var max_stacks
var one_shot
var icon
var description
var timer

func _init(_id, _target, time = null, _max_stacks = 1, _one_shot = false, _icon = null, _description = null):
	target = _target
	id = _id
	max_stacks = _max_stacks
	one_shot = _one_shot
	icon = _icon
	description = _description
	
	if time != null:
		timer = CustomTimer.new(time)
		timer.connect("timeout", self, "remove_stack")
		target.connect("process_signal", timer, "_process")
	
	if !is_permanent():
		add()


func add():
	stacks += 1
	stacks = max(stacks, max_stacks)
	if !is_permanent():
		timer.start()


func remove_stack():
	stacks -= 1
	if one_shot or stacks <= 0:
		remove()


func is_permanent():
	return timer == null


func remove():
	target.remove_status(id)