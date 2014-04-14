require 'midilib/sequence'
require 'midilib/io/seqreader'
include MIDI
 # Create a new, empty sequence.
 seq = Sequence.new()

 # Read the contents of a MIDI file into the sequence.
 File.open('from_scratch.mid', 'rb') { | file |
     seq.read(file) { | num_tracks, i |
         # Print something when each track is read.
         puts "read track #{i} of #{num_tracks}"
     }
 }
