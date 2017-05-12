
```ruby

# Create a new Time class object.
t = Time.now

# Convert it to am array.
ta = t.to_a

# Make an array of all the parts and shovel in the time object array.
to_parts = ['sec', 'min', 'hour', 'day', 'month', 'year', 'wday', 'yday', 'isdst', 'tz'] << ta

# Iterate through all the items and explain what they are.
to_parts.each_with_index {
  |item, index| puts "Time object array item #{index + 1} = #{item} = #{to_parts[10][index]}"}

```
