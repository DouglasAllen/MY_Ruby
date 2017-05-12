

# piglatin convertor 
require 'tk'
#
class PigBox
  def response(word)
    case word
    when /^aeiouy/
      word + 'way'
    when /^([^aeiouy]+)(.*)/
      Regexp.last_match(2) + Regexp.last_match(1) + 'ay'
    else
      word
    end
  end

  def pig(word)
    leading_cap = word =~ /^A-Z/
    word.downcase!
    res = response(word)
    leading_cap ? res.capitalize : res
  end

  def show_pig
    @text.value = @text.value.split.collect { |w| pig(w) }.join(' ')
  end

  def i_vars
    @ph = { 'padx' => 10, 'pady' => 10 } # common options
    @text = TkVariable.new
    @root = TkRoot.new { title 'Pig' }
    @top = TkFrame.new(@root)
    TkLabel.new(@top) { text 'Enter Text:'; pack(@ph) }
    @entry = TkEntry.new(@top, 'textvariable' => @text)
    @entry.pack(@ph)
  end

  def initialize
    i_vars
    p = proc { show_pig }
    TkButton.new(@top) { text 'Pig It'; command p; pack @ph }
    TkButton.new(@top) { text 'Exit'; command { proc exit }; pack @ph }
    @top.pack('fill' => 'both', 'side' => 'top')
  end
end

PigBox.new
Tk.mainloop
