#== Synopsis
#OpenLinkCruftRemover (v1.02): removes unneeded text from OpenLink output, returning only the HL7 text
#
#== Usage
# ruby OpenLinkCruftRemover.rb [OPTIONS] filename
#
#== Options
#-h, --help:: returns this help text.
#-v, --version:: returns the version number of the program
#
#== Version History
#1.00:: original implementation
#1.01:: corrected filename output
#1.02:: activated command line option parsing
#1.03:: Added NTE, SCH, OBR, and OBX segments


require 'getoptlong'
require 'rdoc/usage'

# Parse command line for options & filename
Version = "v1.03"

opts = GetoptLong.new(
  ['--help','-h',GetoptLong::NO_ARGUMENT],
  ['--version','-v',GetoptLong::NO_ARGUMENT]
)
begin

  opts.each do |opt,arg|
    case opt
      when '--help'
        RDoc::usage
        exit 0
      when '--version'
        puts
        puts "Current Version: #{Version}"
        exit 0
    end
  end

rescue
  RDoc::Usage
  exit 0
end

if ARGV.length != 1
  puts "FATAL ERROR: Missing filename (try --help)"
  exit 0
end

filename = ARGV.shift

# Check if filename is good

unless File.exists?(filename)
  puts "FATAL ERROR: #{filename} does not exist!"
  exit 0
end

# Establish needed variables

#If new HL7 header segments are needed, insert them into this array!
header_tags = ['MSH','EVN','PID','NK1','PV1','PV2','GT1','IN1','MSA','AIS','SCH','NTE','OBR','OBX']

tmp_filename = "#{filename}.tmp"
in_transaction_flag = false

# Open input file, create output file

f_in = File.new(filename)
f_out = File.new(tmp_filename,"w+")

# Read input file, create temporary file that has each transaction on a single line...
while line=f_in.gets
  line.chomp!
  if line == '' or line[0,1] != ' '
    if in_transaction_flag
      f_out.puts
      f_out.puts
      in_transaction_flag = false
    end
  else
    in_transaction_flag = true
    f_out.print line[53..68]
  end
end

f_in.close
f_out.close

# now let's parse the temporary file, replacing the period in each of the header_tags with a newline....
# We will create and write to the final output file here
new_out_filename = "#{filename[0..-5]}_out.txt"

f_in = File.new(tmp_filename)
f_out = File.new(new_out_filename,"w+")

while line = f_in.gets
  line.chomp!
  if line == ''
    f_out.puts
    next
  end
  header_tags.each {|tag|
    line.gsub!(".#{tag}","\n#{tag}")
  }
  f_out.puts line

end


f_in.close

#Delete intermediary file!
File.delete(tmp_filename)

f_out.close