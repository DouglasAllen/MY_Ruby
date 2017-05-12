require 'win32/sapi5'
   include Win32

   v = SpVoice.new
   v.Speak("Shall we play a game?")
put self.method