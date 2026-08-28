class_name PrototypeClicker
extends Control
## A clicker prototype creating stardust.

# How to document a class.
# Use double #

## A reference to the label displaying the current amount of stardust created.
@export var label:Label

## Reference to the user interface.
@export var user_interface:UserInterface
## View reference.
@export var view:UserInterface.Views

## The amount of stardust created.
var stardust:int = 0

# Runs when this node is created.
## Initializes the label on launch.
func _ready() -> void:
	update_label_text()
	visible = false
	user_interface.navigation_requested.connect(_on_navigation_request)

# Better to isolate this function rather than putting it in
# the button pressed function just so we know where things are.
## Adds one stardust.
func create_stardust() -> void:
	stardust += 1
	update_label_text()

## Refresh the label to display the current amount of stardust.
func update_label_text() -> void:
	label.text = "Stardust : %s" %stardust

## Triggered when the create stardust button is pressed.
func _on_button_pressed() -> void:
	create_stardust()
## Determines whether the object is visible or not.
func _on_navigation_request(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
	visible = false
