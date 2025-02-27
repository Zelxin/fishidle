extends Button

@export var FishLabel: Label
@export var MoneyLabel : Label
@onready var fish_label = $"../FishCaughtLabel"
@onready var money_label = $"../CurrencyLabel"
var money = 0

func _on_button_pressed():
	GameManager.catch_fish()
	fish_label.text = "Caught: " + str(GameManager.fish_caught)
	money_label.text = "Money: $" + str(GameManager.money)
