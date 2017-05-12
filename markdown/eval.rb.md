#! /home/douglineasalinelineen/.rbenv/versions/2.2.0/bin/ruby

```ruby
require 'irb'
require 'pp'

text = ''
line = ''
# indent = 0
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
  printf "ERR: %s\n", $! || 'exception raised'
end
```
