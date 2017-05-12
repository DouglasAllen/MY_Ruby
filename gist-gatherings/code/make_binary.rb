def make_bin(x)
pv = [128,64,32,16,8,4,2,1]
br = [0,0,0,0,0,0,0,0]
index = 0
pv.each do |i|
if (x / i) >= 1
br[index] = 1
x= x - i
end
index += 1
end
br
end
 
for cr in 0..255
p make_bin cr
end 

# see https://gist.github.com/DouglasAllen/5602489
