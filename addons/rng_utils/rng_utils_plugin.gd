@tool
extends EditorPlugin


func _enter_tree():
	add_autoload_singleton("RngUtils", "res://addons/rng_utils/rng_utils.gd")

func _exit_tree():
	# Clean-up of the plugin goes here.
	pass
