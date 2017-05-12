# hash_test.rb

def add_pairs_to_table h, k, v
	new_table = Hash[k,v]
	h.merge(new_table)
end

k = :sym1
v = "first"
h = Hash[k, v]
p h.class
puts h
k = :sym2
v = "second"
h = add_pairs_to_table h, k, v
puts h
k = :sym3
v = "third"
h = add_pairs_to_table h, k, v
puts h
