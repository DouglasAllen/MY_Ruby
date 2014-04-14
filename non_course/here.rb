@d = Dir.new(Dir.home)
@files = []
@d.each {|file| @files << file}
#~ p @files
@dirs = []
@files.each {|list| @dirs  << list if File.directory?(list)}
p @dirs
@dirs.each {|file| puts file}