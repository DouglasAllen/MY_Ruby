class MyOwnRubyClass 
	def my_own_ruby_method(my_parameter, your_parameter) 
		"print current time" 
		#puts "#{Time.now}" 
		t = Time.now 
		#puts "#{t.month}" 
		current_time = t
		#puts current_month 
		"invoke yield parameters" 
		yield(my_parameter, your_parameter, current_time) 
	end 
end 

my_instance = MyOwnRubyClass.new 
my_instance.my_own_ruby_method("my_parameter", "your_parameter") {|x,y,z| puts "#{x}\n#{y}\n#{z}"} 

=begin
Note that your yield has 3 parameters: yield(my_parameter, 
your_parameter, current_month). 
But you are only using 2 of them: {|x,y| puts "#{x} #{y}"} 
What you need to so is use the third :) 
So instead of |x,y| you'll have something like |x,y,z| 
If you already know how to make it work hardcoding the number, now you 
just need to use z instead. 

Inside your block you wrote your whole puts inside quotes, instead of 
just quoting what it is supposed to print. 
Also double check the order of your parameters. 

Bani, 
I actually just included that as you responded! Thanks for your fast 
response! 
thank you guys, once I put the puts outside the quotes, it works... 
- Saurabh 
Thanks Bryan, 
I did not realize that there was a Time.now.month. I actually created a 
hash that went something like: 
current_month = { 
"Jan" => 1, "Feb" => 2, "Mar" => 3, 
"Apr" => 4, "May" => 5, "Jun" => 6, 
"Jul" => 7, "Aug" => 8, "Sep" => 9, 
"Oct" => 10, "Nov" => 11, "Dec" => 12 
}[Time.now.to_s[4..6]] 
While I was typing it I kept thinking that I could not believe that 
there wasn't a Time.month method but Time.now.month kind of does make 
more sense. I just hadn't thought of it. 
-Bill 
class MyOwnRubyClass 
def my_own_ruby_method(my_parameter, your_parameter) 
puts t= Time.now 
current_month=t.mon 
yield(my_parameter, your_parameter,current_month) 
end 
end 
my_instance=MyOwnRubyClass.new() 
my_instance.my_own_ruby_method('xxxxxx, 'yyyyyyyyy') do |str1,str2,int| 
puts ["#{str1.reverse}, #{str2.reverse}"]*int 
end 
my_instance.my_own_ruby_method('basil', 'shorrosh') do |str1,str2,int| 
puts ["#{str1.length},#{str2.length},#{str1.length + str2.length}"]*int 
End 
-basil 
bshorrosh schrieb: 
- Hide quoted text - 
- Show quoted text - 
> class MyOwnRubyClass 
> def my_own_ruby_method(my_parameter, your_parameter) 
> puts t= Time.now 
> current_month=t.mon 
> yield(my_parameter, your_parameter,current_month) 
> end 
> end 
> my_instance=MyOwnRubyClass.new() 
> my_instance.my_own_ruby_method('xxxxxx, 'yyyyyyyyy') do |str1,str2,int| 
> puts ["#{str1.reverse}, #{str2.reverse}"]*int 
> end 
> my_instance.my_own_ruby_method('basil', 'shorrosh') do |str1,str2,int| 
> puts ["#{str1.length},#{str2.length},#{str1.length + str2.length}"]*int 
> End 

I don't think that's the correct solution. As I asked in 
http://groups.google.com/group/ruby-on-rails-programming-with-passion... 
the output should be 
1 gnas, nihs 
2 gnas, nihs 
3 gnas, nihs 
and not just 
gnas, nihs 
gnas, nihs 
gnas, nihs 
Bye, 
Martin 
Thanks for pointing this out..easy fix! 

On Jul 27, 10:08 am, "bshorrosh" <bshorr...@gmail.com> wrote: 
> Thanks for pointing this out..easy fix! 

For those who are following this thread and are still wondering what 
the easy fix is, try with this instruction inside the first block: 
1.to(int) do |i| puts "#{i.to_s} #{str1.reverse}, #{str2.reverse}" end 
Something similar can be used for the second block. 
Greets. 
Two quick observations: 
a) puts "#{i.to_s} .." 
Conversion to string is automatic here; so: puts "#{i} ..." 
b) 1.to(int) ... 
there is no method 'to' for a Fixnum (unless it has been added for 
JRuby). If you want to stay within Ruby, do: 1.upto(n). 
Also: I would not call a variable 'int' just because it happens to hold a 
Fixnum. I would call it 'n', 'count', 'limit' etc. This is perhaps a matter 
of taste (but I think it is more important than that). 
Raul 
You're right Raul, so at the end it should read like this: 
1.upto(int) do |i| puts "#{i} #{str1.reverse}, #{str2.reverse}" end 
The variable's name "int" stays to be coherent with the example given 
by bshorrosh 
=end
