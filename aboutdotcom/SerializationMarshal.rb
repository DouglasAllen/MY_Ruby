# http://ruby.about.com/od/advancedruby/ss/Serialization-In-Ruby-Marshal.htm

counter = if File.exist?('counter')
            File.open('counter') do |file|
              Marshal.load(file)
            end
          else
            0
          end

puts "Counter is currently at #{counter}"
puts "incrementing to #{counter + 1}"

counter += 1

File.open('counter', 'w') do |file|
  Marshal.dump(counter, file)
end

# b http://ruby.about.com/od/advancedruby/ss/Serialization-In-Ruby-Marshal_2.htm
class Logfile
  def initialize(filename)
    @filename = filename

    # This IO object can't be marshaled
    @io = File.open(filename, 'w')
  end

  def marshal_dump
    log 'Being marshaled'

    # Dump just the filename, leave the IO object alone
    @filename
  end

  def marshal_load(filename)
    @filename = filename
    @io = File.open(@filename, 'a')
    log 'Unmarshaled'
  end

  def log(message)
    @io.puts "#{Time.now}: #{message}"
  end
end

logfile = if File.exist?('logfile')
            File.open('logfile') do |file|
              Marshal.load(file)
            end
          else
            Logfile.new('log.txt')
          end

ARGV.each do |message|
  logfile.log message
end

File.open('logfile', 'w') do |file|
  Marshal.dump(logfile, file)
end
