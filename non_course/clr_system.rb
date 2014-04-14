require 'dl/import'

class MyDotNET
    module DotNET
      
      extend DL::Importer
      dlload "mscorlib"
      
      
      extern "string System::Version.ToString()"
      #~ extern "int midiOutOpen(HMIDIOUT*, int, int, int, int)"
      #~ extern "int midiOutClose(int)"
      #~ extern "int midiOutShortMsg(int, int)"
    end
end