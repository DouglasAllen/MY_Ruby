
```ruby
require 'irb/ruby-lex'
require 'stringio'

class RubyLexEasy < RubyLex
  class Continue < StandardError;end
  class Empty < StandardError;end
  def initialize
    super
    set_input(StringIO.new)
  end
  def run(str)
    obj=nil
    @io << str
    @io.rewind
    unless l = lex
      raise Empty if @line == ''
    else
      @line << l << "\n"
      if @ltype or @continue or @indent > 0
        raise Contine
      end
    end
    obj = eval @line, TOPLEVEL_BINDING
    @line = ''
    @exp_line_no = @line_no

    @indent = 0
    @indent_stack = []
    obj
  ensure
    set_input(StringIO.new)
  end
end

rle = RubyLexEasy.new

rle.run("(0..9).each {|o| puts o};puts 'you just ran rle'")
```
