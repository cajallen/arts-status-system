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

func _init(args):
	id = args["id"]
	target = args["target"]
	max_stacks = args.get("max_stacks", 1)
	one_shot = args.get("one_shot", false)
	icon = args.get("icon", null)
	description = args.get("description", null)
	
	if "time" in args:
		timer = CustomTimer.new(args["time"])
		timer.connect("timeout", self, "remove_stack")
		target.connect("process_signal", timer, "_process")
	
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