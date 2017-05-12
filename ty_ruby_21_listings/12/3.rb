#!/usr/local/bin/ruby

# A Ruby script to solve and animate the Towers of Hanoi puzzle.

require 'peg'

def main
  # Get user input for initial height, defaulting to 7.
  @height = (ARGV[0] or 7).to_i

  # Make an array of three Peg objects.
  @pegs = [0,1,2].map {|x| Peg.new(x,@height)}

  sleep 2                     # Take a little pause for drama ...
  move_tower 0,2,@height      # ... then move the stack!
end

# Recursive function to move 'n' disks
#   from peg 'src' to peg 'dst'.
#
# In the recursive case ...
#   move all but the bottom disk to the intermediate peg,
#   move the bottom disk to the destination peg,
#   and then move the others on top of it.
#
# In the base case, just move that 1-disk stack.
#
def move_tower(src, dst, n)
  if n>1    # RECURSIVE CASE
    intermediate = 3 - (src+dst)        # think about it...
    move_tower(src, intermediate, n-1)
    @pegs[dst].drop(@pegs[src].lift)
    move_tower(intermediate, dst, n-1)
  else      # BASE CASE
    @pegs[dst].drop(@pegs[src].lift)
  end
end

main  # Script actually executes here.
