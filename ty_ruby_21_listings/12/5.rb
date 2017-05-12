# A very simple ANSI module.
# This could be enhanced considerably.

module ANSI
  Reset           = 27.chr + "c"
  PRE             = 27.chr + "["  # the ubiquitous ANSI escape prefix
  Clear           = PRE + "2J"
  Normal          = PRE + "0m"
  Bold            = PRE + "1m"
  LowIntensity    = PRE + "2m"
  Underline       = PRE + "4m"
  Blinking        = PRE + "5m"
  Reversed        = PRE + "7m"
  Up              = PRE + "A"
  Down            = PRE + "B"
  Right           = PRE + "C"
  Left            = PRE + "D"
  Home            = PRE + "H"
  WrapOn          = PRE + "?7h"
  WrapOff         = PRE + "?7l"

  def fore_color( c )
    sprintf "%s3%dm",PRE,c
  end
  def back_color( c )   
    sprintf "%s4%dm",PRE,c
  end
  def locate( x, y )
    sprintf "%s%d;%df",PRE,y,x
  end
end
