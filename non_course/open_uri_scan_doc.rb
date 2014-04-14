# open_uri_scan_doc.rb

require 'open-uri'

url = 'http://ruby-metaprogramming.rubylearning.com/html/ruby_metaprogramming_1.html' # =&gt; String
pattern = /\bthe\b/i  # =&gt; Regexp
doc = open(url) # =&gt; StringIO
html_string = doc.readlines.join             # =&gt; String
count = html_string.scan(pattern).size    # =&gt;  Fixnum
puts "The number of times the word 'the' appears in the document is #{count}."