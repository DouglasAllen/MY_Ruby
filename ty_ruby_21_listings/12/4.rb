require 'ansi'

class Peg
  include ANSI

  # Create a peg in position 'c' that can hold 'n' disks.
  def initialize(c,n)
    print Clear if c==0
    @contents = []
    @column = c
    @disks = n
    1.upto(n+1) {|p| show_blank(p)}  # show the peg, empty
    if c==0
      @delay = 0
      n.downto(1) {|disk| drop(disk)}
    end
    @delay = 2 ** (2-n)  # adjust delays to size of puzzle
  end

  # Place a disk of width 'w' on the peg.
  def drop(w)
    @contents.push(w)
    show_disk(size,w,@delay)
  end

  # Take a disk off the top of the peg, and return its width.
  def lift
    show_blank(size)
    @contents.pop
  end

  ### PRIVATE METHODS FOLLOW.
  private

  # Place the cursor at the given height on the peg.
  def set_cursor(position)
    print locate((@disks*2+2)*@column+4, @disks+4-position)
  end

  # Show a disk at position 'p' with width 'w'; delay 'd' seconds.
  def show_disk(p,w,d)
    set_cursor p
    print " "*(@disks-w)
    print back_color(1+(w % 6))  # map disk widths to colors
    print " "*(w*2+1)
    print Normal
    update
    sleep d
  end

  # Erase the disk at position 'p'.
  def show_blank(p)
    set_cursor p
    print Normal
    print " "*@disks + "|" + " "*@disks
    update
  end

  # Return the occupancy of the peg.
  def size
    @contents.size
  end

  # Update the display.
  def update
    print locate(1,1)
    STDOUT.flush
  end

end