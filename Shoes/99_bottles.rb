
require 'green_shoes'
Shoes.app do
  99.downto(1) do |i|
    stack do
      para "#{bottle(i)} on the wall,"
      para "#{bottle(i)}, take one down, pass it around,"
      para "#{bottle(i - 1)} on the wall.\n"
    end
  end
end

def bottle(x)
  case x
  when 0 then 'no more bottles'
  when 1 then '1 bottle'
  else "#{x} bottles"
  end + ' of beer'
end

# window do
# end

# puts <<GROCERY_LIST
# Grocery list
# ------------
# 1. Salad mix.
# 2. Strawberries.*
# 3. Cereal.
# 4. Milk.*

# * Organic
# GROCERY_LIST

# now = Time.now
# puts <<-EOF
#  It's #{now.hour} o'clock John, where are your kids?
#  EOF
