#~ require 'win32console'
#~ include Win32::Console::ANSI
#~ puts "\e[1;34mThis text is bold blue.\e[0m"
#~ puts "\e[32m    takes three parameters and returns a Book object\e[0m"
#~ http://adoxa.3eeweb.com/ansicon/index.html
require_relative '../library'
require_relative '../book'
require 'yaml'