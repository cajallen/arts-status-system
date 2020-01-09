extends Node
signal process_signal(delta)

var statuses = { }
var speed_effects = { }
#demonstration variables
var health = 100


func _process(delta):
	emit_signal("process_signal", delta)
	print(health)


func add_status(id, status):
	statuses[id] = status

func remove_status(id):
	statuses.erase(id)


func update_stat(numerical_effects):
	var base = 0.0
	var mult = 1.0
	var add = 0.0
	
	for effect in numerical_effects.values():
		if effect.type == "base":
			base += effect.value * effect.stacks
		if effect.type == "mult":
			mult *= pow((1 + effect.value), effect.stacks)
		if effect.type == "add":
			add += effect.value * effect.stacks
	
	return base * mult + add


func get_speed():
	return update_stat(speed_effects)