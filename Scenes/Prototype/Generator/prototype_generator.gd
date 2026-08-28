class_name PrototypeGenerator
extends Control
## Prototype for a generator that passively generates stardust.

## Reference to button that activate generator.
@export var button:Button

## Reference to Timer that controls how fast stardust is generated.
@export var timer:Timer

## Reference to label displaying the current amount of stardust made.
@export var label:Label

## Reference to the user interface.
@export var user_interface:UserInterface
## View reference.
@export var view:UserInterface.Views

## The current amount of stardust made.
var stardust:int = 0

## Initialize the text when the node is created.
func _ready() -> void:
	update_label_test()
	user_interface.navigation_requested.connect(_on_navigation_request)

## Adds one stardust.
func create_stardust() -> void:
	stardust += 1
	update_label_test()

## Updates the label text to display how much stardust has been created.
func update_label_test() -> void:
	label.text = "Stardust : %s" %stardust

## Starts the generator and disables the button.
func begin_generating_stardust():
	timer.start()
	button.disabled = true
	visible = true

## Triggered when the button is pressed.
func _on_button_pressed() -> void:
	begin_generating_stardust()

## Triggered when the timer times out.
func _on_timer_timeout() -> void:
	create_stardust()
## Determines whether the object is visible or not.
func _on_navigation_request(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
	visible = false
