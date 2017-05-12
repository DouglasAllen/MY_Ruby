#! /home/douglasallen/.rbenv/versions/2.2.0/bin/ruby

```ruby
require 'irb'
require 'pp'

text = ''
line = ''
# indent = 0
$stdout.sync = true
print "enter ruby code or type 'quit' to exit.\n"

until line == "quit\n"

  line = gets
  next if line == "quit\n"
  text << line

  begin
    # print text
    print eval(text).pretty_inspect, "\n"
  rescue ScriptError, StandardError
    printf "ERR: %s\n", $ERROR_INFO || 'exception raised'
  end

end
```
