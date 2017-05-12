```ruby
# require 'rubygems'
require 'complex'
require 'RMagick'
include Magick

# this is the interesting area of the complex plane
X_START = -2.0
X_END = 0.5
Y_START = -1.0
Y_END = 1.0

# wanted image dimensions
WIDTH = 600.0
HEIGHT = 400.0

# set this to higher values and sleep well :)
ITERATIONS = 200

STEP_X = (X_END - X_START) / WIDTH
STEP_Y = (Y_END - Y_START) / HEIGHT

def mandelbrot(a)
  Array.new(ITERATIONS, a).inject(a) { |z, c| z * z + c }
end

complex_plane = Image.new(WIDTH.to_i, HEIGHT.to_i)



draw = ->(x_pixel, y_pixel, complex_plane) do
  Draw.new.fill('#000000').point(x_pixel,y_pixel).draw(complex_plane)
end

MIN_X =
  x_pixel = 0
y_pixel = 0

x = X_START
y = Y_START

# set = []
while y < Y_END
  x_pixel = 0
  x = X_START
  while x < X_END
    mandelbrot(Complex(x, y)).abs < 2 ? Draw.new.fill('#000000').point(x_pixel,y_pixel).draw(complex_plane) : nil
    # mandelbrot(Complex(x, y)).abs < 2 ? set << x_pixel << y_pixel : nil

    x_pixel += 1
    x += STEP_X
  end
  y_pixel += 1
  y += STEP_Y
end

# do something with set
complex_plane.write('mandelbrot.png')
```
