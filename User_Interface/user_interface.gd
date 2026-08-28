class_name UserInterface
extends Control
## Main class controlling the user interface.

## List of views.
enum Views {
	PROTOTYPE_GENERATOR,
	PROTOTYPE_CLICKER,
}

## Emitted when something requested navigation. Includes view target.
signal navigation_requested(view:Views)

## Triggered when the prototype clicker is clicked.
func _on_prototype_generator_link_pressed() -> void:
	navigation_requested.emit(Views.PROTOTYPE_GENERATOR)

## Triggered when the prototype generator is clicked.
func _on_prototype_clicker_link_pressed() -> void:
	navigation_requested.emit(Views.PROTOTYPE_CLICKER)
