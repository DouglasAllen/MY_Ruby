
# could be the start of a nice spirograpgh program
# require 'green_shoes'

Shoes.app height: 820, width: 1420, title: '     Roseland Revisited' do
  background black
  @center_y = height / 2
  @center_x = width / 2
  @radius = @center_x / @center_y * @center_x
  para @radius.to_s

  # aspect ratio
  ar = width / height

  # generations
  g = 4

  # limit is one circle but we could go half or more
  # depending on how long you want to wait.
  @pi2 = Math::PI * 2
  @circle = (0..@pi2)

  # multiply this if you want larger or smaller steps
  # the base number is just a guess so try other numbers.
  @step = 0.000175 * Math::PI * 4

  # depending on steps and number of iterations sometimes makes you wait.
  # be patient then if you want to see the drawing.
  # Otherwise experiment with some variables like g, stroke color and @step
  @circle.step(@step) do |i|
    r = 400 * Math.sin(g * i) # we vary the radius as we rotate
    x = (r * Math.cos(i)) + @center_x
    y = (r * Math.sin(i)) * ar + @center_y
    # color of lines
    stroke indigo
    # the iterations here control thickness of lines
    1.times do
      line x.to_i.abs, y.to_i.abs, x + 3, y + i
    end
  end
end

# this won't run out side of green_shoes so drop this back
# in if you use other shoes
# replace delete the four lines after y = in the block above with
# point x.to_i.abs, y.to_i.abs, tan, 3

def point(x, y, color, size)
  stroke color
  (0..size).each do |i|
    line x.to_i.abs, y.to_i.abs, x + size, y + i
  end
end
