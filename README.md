#arts-status-system

### Class: Status
Description
This is the base Status class which is rather useless on it's own, but provides self management and useful functions to extend
the "add" function should be extended to have an event on status application (please still call super)
the "remove_stack" function should be extended to have an event on status removal (please still call super)
the "remove" function should be extended to have an event on status deletion (please still call super)

Required Arguments
id: arbitrary string id to identify unique objects and remove stacks/objects
target: Unit class affected by status (this should be showing up in scripts which extend Status as it's how the Unit class is actually affected by the Status typically)

Optional Arguments
max_stacks (default = 1): if this status multiple times, set this number to increment instead of overriding when adding new stacks
one_shot (default = false): if this status has a timer and an amount of max stacks greater than one, it will remove the status when the remove_stack function is called instead of removing a stack
icon (default = null): if this status has a non null icon, it will display it on the HUD (for future use)
description (default = null): if this status has a non null icon, it will display this along side it's icon for the description of the status in game
time: if this status has a time, it will instance a CustomTimer and connect process_signal from the Unit object to decrement the timer, and the timeout method from the Timer to the remove_stack method from self



### Class: Numerical Status (extends Status)
Description
This status affects a numerical stat already defined in the Unit base class

Required Arguments
type: The math type to alter the stat by. possible arguments are "base", "mult", or "add". Formula is add(bases) * mult(mults) + add(adds)
value: The number to use in the math
effect_dict: The effect dict to add the status to. This should be declared in the Unit Class



###Class: Echo Status
Description
This status provides access to the _process(delta) virtual method
the "_process(delta)" function should be used to have an event trigger on every frame