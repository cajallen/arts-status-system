extends Resource
class_name CustomTimer
# I made this class mostly because I hate how the default timer works, 
# but I also wanted a timer to be a variable of Status. I would have had
# Timer.new() be what you put in the init vars, except you'd still have to
# add_child from the Status-having class, and I don't think you can
# do that from within status without having weird signals.

signal timeout

var total_time: float setget set_total_time, get_total_time
var remaining_time: float setget set_remaining_time, get_remaining_time
var processing: = false


"""virtual functions"""
func _init(time: = 0.0) -> void:
	if time != 0.0:
		start(time)


func _process(delta: float) -> void:
	if !processing:
		return
	
	remaining_time -= delta
	if remaining_time <= 0.0:
		stop()
"""/virtual functions"""


func start(time = total_time) -> void:
	if time == null:
		return
	total_time = time
	remaining_time = total_time
	processing = true


func stop() -> void:
	remaining_time = 0.0
	processing = false
	emit_signal("timeout")


"""get set functions"""
func set_total_time(time: float) -> void:
	total_time = time

func get_total_time() -> float:
	return total_time

func set_remaining_time(time: float) -> void:
	if time <= 0.0:
		stop()
	remaining_time = time

func get_remaining_time() -> float:
	return remaining_time
"""/get set functions"""