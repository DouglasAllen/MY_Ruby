########################################################################
# test.rb
#
# A test script for general futzing.  Modify as you see fit. You can
# run this test script via the 'rake example' task.
########################################################################
$LOAD_PATH.unshift(
   File.join(
      File.dirname(File.expand_path( File.dirname(__FILE__))), 'ext'
   )
)

require 'win32/changejournal'
include Win32

puts "VERSION: " + ChangeJournal::VERSION

cj = ChangeJournal.new("c:\\")

# Wait up to 5 minutes for a change journals
cj.wait(300){ |array|
   array.each{ |struct|
      puts "Something changed"
      puts "File: " + struct.file_name
      puts "Action: " + struct.action
      puts "Path: " + struct.path
   }
}

cj.delete
