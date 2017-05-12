
#

require 'irb'
require 'pp'

text = ''
line = ''

$stdout.sync = true
print "enter ruby code then type 'run' when ready.\n"

until line == "run\n"

  line = gets
  next if line == "run\n"
  text << line

end

begin
  print text
  print eval(text).pretty_inspect, "\n"
rescue ScriptError, StandardError
  printf "ERR: %s\n", $ERROR_INFO || 'exception raised'
end

