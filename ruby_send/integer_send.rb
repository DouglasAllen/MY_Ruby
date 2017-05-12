p 5.send :methods
p 5.send :to_s
p 5.send :-@
p 5.send :+, 1
p 5.send :-, 1
p 5.send :*, 2
p 5.send :/, 5
p 5.send :div, 5
p 5.send :%, 2
p 5.send :modulo, 2
p 5.send :divmod, 3
p 5.send :fdiv, 3
p 5.send :**, 2
p -5.send :abs
p 5.send :magnitude
p 5.send :to_f
p 5.send :size
p 5.send :succ
p 5.send :upto, 8
p 5.send :downto, 2
p 5.send :times
p 5.send :next
p 5.send :pred
p 5.send :chr
p 5.send :ord
p 5.send :to_i
p 5.send :to_int
p 5.1.send :floor
p 4.9.send :ceil
p 5.0.send :truncate
p 5.0.send :round
p 5.send :gcd, 3
p 5.send :lcm, 4
p 5.send :gcdlcm, 4

#~ p 5.send :singleton_method_added, needs a method  

#, :nonzero?, :step, :to_c, :real, :imaginary, :imag, :abs2, :arg, :angle, :phase, :rectangular, :rect, :polar, :conjugate, :conj, :between?, :nil?, :=~, :!~, :hash, :class, :singleton_class, :clone, :dup, :initialize_dup, :initialize_clone, :taint, :tainted?, :untaint, :untrust, :untrusted?, :trust, :freeze, :frozen?, :inspect, :methods, :singleton_methods, :protected_methods, :private_methods, :public_methods, :instance_variables, :instance_variable_get, :instance_variable_set, :instance_variable_defined?, :instance_of?, :kind_of?, :is_a?, :tap, :send, :public_send, :respond_to?, :respond_to_missing?, :extend, :display, :method, :public_method, :define_singleton_method, :object_id, :to_enum, :enum_for, :equal?, :!, :!=, :instance_eval, :instance_exec, :__send__, :__id__]




