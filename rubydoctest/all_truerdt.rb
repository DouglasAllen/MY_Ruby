
# >> all_true = true
# >> a = [true, true, true]
# >> b = [true, false, true]
# >> 3.times do |t|
#      all_true &&= (a[t] == b[t])
#      end
# >> all_true
# => true

#~ all_true = true
#~ a = [true, true, true]
#~ b = [true, false, true]
#~ 3.times do |t|
  #~ puts t, all_true &&= (a[t] == b[t])
#~ end

#~ system 'rubydoctest all_truerdt.rb'