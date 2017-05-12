
# could be the start of a nice spirograpgh program
require 'green_shoes'

#
class Plotter
  def point(x, y, s)
    2.times do |s|
      line x.to_i.abs, y.to_i.abs, x + s, y + s
    end
  end
end

Shoes.app height: 820, width: 1420, title: '     Roseland Revisited' do
  background black
  p = Plotter.new
  @center_y = height / 2
  @center_x = width / 2
  @radius = @center_y - 8

  # aspect ratio
  ar = width / height

  # loops
  # some odd numbers render exact lobes count. This is just a starting point.
  g = 5

  # limit is one circle but we could go half or more
  # depending on how long you want to wait.
  @pi2 = Math::PI * 2
  @circle = (0..@pi2)

  # multiply this if you want larger or smaller steps
  # the base number is just a guess so try other numbers.
  # This can also have an effect on the thickness of some parts.
  # Smaller is thicker but takes longer.
  @step = 0.000175 * Math::PI * 4

  # depending on steps and number of iterations sometimes makes you wait.
  # be patient then if you want to see the drawing.
  # Otherwise experiment with some variables like g, stroke color and @step
  @circle.step(@step) do |i|
    # we vary the radius as we rotate
    r = @radius * Math.sin(g * i)
    x = (r * Math.cos(i)) + @center_x
    y = (r * Math.sin(i)) * ar + @center_y
    # color of lines
    stroke lightseagreen
    p.point x, y, 2

    # the iterations here control thickness of lines
    # 2.times do |s|
    #   line x.to_i.abs, y.to_i.abs, x + s, y + s
    # end
  end
end
