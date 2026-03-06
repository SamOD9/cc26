extends Node2D

func change_instrument(channel, instrument):
	var midi_event = InputEventMIDI.new()
	midi_event.channel = 0
	midi_event.message = MIDI_MESSAGE_PROGRAM_CHANGE
	midi_event.instrument = instrument
	$MidiPlayer.receive_raw_midi_message(midi_event)
	
	
var pattern = []

func drum_loop():
	for i in range(16):
		pattern.append(randi_range(36, 60))
	
	while true:
		for i in range(pattern.size()):
			play_note(pattern[i] , 0.2, 9) 
			await get_tree().create_timer(0.25).timeout

func _ready() -> void:
	drum_loop()
	#change_instrument(0, 30)
	#while true:
		#for i in range(2):
			#for note in range(39, 35, -1):
				#play_note(note, 0.2, 0)
				#await get_tree().create_timer(0.5).timeout
		#for i in range(2):
			#for note in range(36, 40, 1):
				#play_note(note, 0.2, 0)			
				#await get_tree().create_timer(0.5).timeout
		#for i in range(2):
			#for note in range(39, 35, -1):
				#play_note(note, 0.2, 0)
				#await get_tree().create_timer(0.5).timeout
		#for i in range(2):
			#for note in range(36, 40, 1):
				#await get_tree().create_timer(0.5).timeout
				
	
	#while true:
#
		#var note = randi_range(0, 127) 
		#var m = InputEventMIDI.new()
		#m.message = MIDI_MESSAGE_NOTE_ON
		#m.pitch = note
		#m.velocity = 100
		#m.channel = 0			
		#$MidiPlayer.receive_raw_midi_message(m)			
		#await get_tree().create_timer(1).timeout
		#m = InputEventMIDI.new()
		#m.message = MIDI_MESSAGE_NOTE_OFF
		#m.pitch = note
		#m.velocity = 100
		#m.channel = 0			
		#$MidiPlayer.receive_raw_midi_message(m)	
		
		
		


func _on_button_button_down() -> void:
	var m = InputEventMIDI.new()
	m.message = MIDI_MESSAGE_NOTE_ON
	m.pitch = $HSlider.value
	m.velocity = 100
	m.channel = 0			
	$MidiPlayer.receive_raw_midi_message(m)	
	pass # Replace with function body.
	
func play_note(note, duration, channel):
	var m = InputEventMIDI.new()
	m.message = MIDI_MESSAGE_NOTE_ON
	m.pitch = note
	m.velocity = 100
	m.channel = channel		
	$MidiPlayer.receive_raw_midi_message(m)	
	await get_tree().create_timer(duration).timeout
	m = InputEventMIDI.new()
	m.message = MIDI_MESSAGE_NOTE_OFF
	m.pitch = note
	m.velocity = 100
	m.channel = channel		
	$MidiPlayer.receive_raw_midi_message(m)	
	
func _on_button_button_up() -> void:
	var m = InputEventMIDI.new()
	m.message = MIDI_MESSAGE_NOTE_OFF
	m.pitch = $HSlider.value
	m.velocity = 1
	m.channel = 0			
	$MidiPlayer.receive_raw_midi_message(m)	

	pass # Replace with function body.


func _on_inst_slider_value_changed(value: float) -> void:
	change_instrument(0, value)
	pass # Replace with function body.
