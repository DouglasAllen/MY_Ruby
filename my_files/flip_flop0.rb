
# 1.upto 10 do |i|
#   puts i if i == 3 ... i == 3
# end

W = 88
H = 108
c = 7 * 42 + W
a = [0] * W * H
g = d = 0
f = proc do |n|
  a[c] += 1
  o = a.map { |z| ' :#'[z, 1] * 2 }.join.scan(/.{#{W * 2}}/)
  puts "\f" + o.map(&:rstrip).join("\n")
  sleep 0.005
  d += 1 - 2 * ((g ^= 1 << n) >> n)
  c += [1, W, -1, -W][d %= 4]

end

1024.times do
  !!(
    !!(
      !!(
        !!(
          !!(
            !!(
              !!(
                !!(
                  !!(
                    true...f[0]
                  )...f[1]
                )...f[2]
              )...f[3]
            )...f[4]
          )...f[5]
        )...f[6]
      )...f[7]
    )...f[8]
  )
end
