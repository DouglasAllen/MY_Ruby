class Spinner
  Baton = '\|/-'
  def initialize
    STDOUT.flush
    fd = IO.sysopen("-", "w")
    @child = IO.open(fd, "w+")
    
    if @child.nil?
      rotation = 0
      until select([$stdin], nil, nil, 0.2)
        STDERR.printf "%c\b", Baton[(rotation+=1) & 3]
      end
      STDIN.gets             # read the 'stop' message
      STDERR.printf " \b"    # erase the last baton character
      exit!
    end
  end
  
  def stop
    @child.puts("stop yer spinnin")  # message content is unimportant
    @child.close
  end
end
