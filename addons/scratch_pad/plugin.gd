@tool
extends EditorPlugin

var _dock: EditorDock


func _enter_tree() -> void:
	var text_edit: TextEdit = TextEdit.new()
	text_edit.placeholder_text = "input text"
	text_edit.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	text_edit.size_flags_vertical = Control.SIZE_EXPAND_FILL
	text_edit.custom_minimum_size = Vector2(0, 150)
	text_edit.wrap_mode = TextEdit.LINE_WRAPPING_BOUNDARY
	text_edit.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)

	_dock = EditorDock.new()
	_dock.title = "Scratch Pad"
	_dock.default_slot = EditorDock.DOCK_SLOT_BOTTOM
	_dock.available_layouts = EditorDock.DOCK_LAYOUT_HORIZONTAL | EditorDock.DOCK_LAYOUT_FLOATING
	_dock.add_child(text_edit)
	add_dock(_dock)


func _exit_tree() -> void:
	if _dock:
		remove_dock(_dock)
		_dock.queue_free()
		_dock = null
