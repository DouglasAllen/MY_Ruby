
INV360 = 1.0 / 360.0
def rev180(x)
  p x * INV360
  p x * INV360 + 0.5
  p floor = (x * INV360 + 0.5).floor
  p x - 360.0 * floor
end

rev180(-359.5)
rev180(359.50)
rev180(269.50)
rev180(89.50)
rev180(181)