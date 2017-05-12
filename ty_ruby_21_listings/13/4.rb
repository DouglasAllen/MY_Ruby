class Spinner
  Baton = '\|/-'
  def initialize
    STDOUT.flush
    @child = fork do
      trap('SIGHUP') do
        print " \b"
        STDOUT.flush
        exit!
      end
      rotation = 0
      loop do
        printf "%c\b", Baton[(rotation+=1) & 3]
        STDOUT.flush
        sleep 0.2
      end
    end
  end
  
  def stop
    Process.kill 'SIGHUP', @child
  end
end
