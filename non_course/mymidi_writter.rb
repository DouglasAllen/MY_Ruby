$LOAD_PATH[0, 0] = File.join(File.dirname(__FILE__), '..', 'lib')

require 'die'
require 'spinner'
require 'midilib/sequence'
require 'midilib/consts'
include MIDI

class MidiWriter

  def initialize(instrument=1, filename='midi.mid')
    @filename = '68brown.mid'
    puts @filename
    @instrument = 68
    puts @instrument
  end

  def write(data)
    seq = Sequence.new()
    track = Track.new(seq)
    seq.tracks << track
    track.events << Tempo.new(Tempo.bpm_to_mpq(180))
    track.events << MetaEvent.new(META_SEQ_NAME, 'Sequence Name')
    track = Track.new(seq)
    seq.tracks << track
    track.name = 'My New Track'
    track.events << Controller.new(0, CC_VOLUME, 127)
    track.events << ProgramChange.new(0, @instrument, 0)
    #track.events << ProgramChange.new(0, 63, 0)
    for event in data
      track.events << NoteOnEvent.new(0, event[:note], 127, 0)
      track.events << NoteOffEvent.new(0, event[:note], 127,
        seq.note_to_delta(event[:duration]))
    end
     File.open("#{@filename}", 'wb') { | file |
       seq.write(file)
     }
  end
end


# two octaves of a pentatonic minor scale
# notes = [0, 3, 5, 7, 10, 12, 15, 17, 19, 22, 24, 27, 29, 31, 34] 
notes = [0, 3, 5, 7, 10, 12, 15, 17, 19, 22] 
note_spinner = Spinner.new({:maximum => 9, :edge => 're-enter',
    :slice_values => [-3,-2,-1,1,2,3], :slice_sizes => [3,2,1,1,2,3]})

durations = ['8th','quarter','dotted quarter']
duration_spinner = Spinner.new({:maximum => 2})
midi_data = []
50.times do
  event = {:note => (34 + notes[note_spinner.spin]),
    :duration => durations[duration_spinner.spin]}
    #:duration => '8th'
    #:duration => 'quarter'
    #:duration => 'dotted quarter'}
  midi_data.push(event)
end
writer = MidiWriter.new(1, "#{@filename}")
writer.write(midi_data)

 #~ notes = [0, 3, 5, 7, 10, 12, 15, 17, 19, 22, 24, 27, 29, 31, 34] # two octaves of a major scale
 #~ note_die = Die.new([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14])
 #~ durations = ['8th','quarter','dotted quarter','half',
     #~ 'dotted half','whole']
 #~ duration_die = Die.new([0,1,2,3,4,5])
 #~ midi_data = []
 #~ 24.times do
   #~ #puts notes[note_die.roll] + 64
   #~ event = {:note => (34 + notes[note_die.roll]),
       #~ :duration => durations[duration_die.roll]}
   #~ midi_data.push(event)
 #~ end
 #~ writer = MidiWriter.new(1,'from_die.mid')
 #~ writer.write(midi_data)