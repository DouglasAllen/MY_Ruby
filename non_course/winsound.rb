require 'win32/sound'
   include Win32

   # Get the current volume of the waveform-audio output device.
   p Sound.wave_volume.join(", ") # left channel, right channel

   # Play a system sound
   Sound.play("SystemAsterisk",Sound::ALIAS)
   
   p Sound.devices()

   # Play a wav file
   Sound.play("38brownmix.wav")
