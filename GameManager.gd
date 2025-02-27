extends Node

var money: int = 0
var fish_caught: int = 0;
signal money_changed(new_money: int)  # Define signal
signal fish_caught_changed(new_fish_caught: int)  # Define signal
@export var autofish_enabled: bool = false  # Toggle autofishing in the editor

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer = Timer.new()
	timer.wait_time = 1.0  # Fires every second
	timer.autostart = autofish_enabled  # Start immediately if enabled
	timer.one_shot = false  # Keeps repeating
	timer.timeout.connect(_on_autofish_tick)
	add_child(timer)  # Add the timer to the scene

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_money(amount: int):
	money += amount
	emit_signal("money_changed", money)

func add_fish(fish_count: int):	
	fish_caught +=fish_count
	emit_signal("fish_caught_changed", fish_caught)

func _on_autofish_tick():
	if autofish_enabled:
		catch_fish()
		
func catch_fish():
	var fish_types = ["Salmon", "Trout", "Bass", "Catfish"]
	var caught_fish = fish_types[randi() % fish_types.size()]
	var fish_value = randi() % 10 + 5  # Random value between 5-15
	var fish_name = fish_types[randi() % fish_types.size()]
	add_fish(1)
	add_money(fish_value)
	emit_signal("fish_caught_auto", fish_name)  # Notify UI
