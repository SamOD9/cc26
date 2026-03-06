extends Node2D


func _on_button_button_down() -> void:
	var m = InputEventMIDI.new()
	m.message = MIDI_MESSAGE_NOTE_ON
	m.pitch = 36
	m.velocity = 100
	m.channel = 0			
	$MidiPlayer.receive_raw_midi_message(m)	
	pass # Replace with function body.


func _on_button_button_up() -> void:
	var m = InputEventMIDI.new()
	m.message = MIDI_MESSAGE_NOTE_OFF
	m.pitch = 36
	m.velocity = 1
	m.channel = 0			
	$MidiPlayer.receive_raw_midi_message(m)	

	pass # Replace with function body.
