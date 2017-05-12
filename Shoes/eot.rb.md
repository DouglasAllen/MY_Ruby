
```ruby
require 'green_shoes'
require 'eot'

Shoes.app width: 400, height: 400 do
  background black
  eot = Eot.new
  stack do
    para "Time now is #{Time.new.utc}", stroke: white
    message = 'Sun Time  '
    para message + eot.display_equation_of_time, stroke: white
  end
end
```
