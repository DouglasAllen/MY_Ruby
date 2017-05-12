# gem install github_markup
require 'github/markup'
file = 'README.md'
str = GitHub::Markup.render(file, File.read(file))
#puts str 
puts <<EOF 
#{str}
EOF
