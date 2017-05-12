# http://www.ruby-doc.org/stdlib-2.0/libdoc/dl/rdoc/DL.htmlAssumes
 
File.open("sum.c", "w+") do |f|
  f.write <<'EOF'
  double sum(double *arry, int len)
  {
   double ret = 0;
   int i;
   for(i = 0; i < len; i++){
     ret = ret + arry[i];
   }
   return ret;
  }
 
  double split(double num)
  {
   double ret = 0;
   ret = num / 2;
   return ret;
  }
EOF
end

system "gcc -o libsum.so -shared sum.c"
File.open("sum.rb", "w+") do |f|
  f.write <<'EOF'
  require 'dl'
  require 'dl/import'
 
  module LibSum
    extend DL::Importer
    dlload './libsum.so'
    extern 'double sum(double*, int)'
    extern 'double split(double)'
  end
 
  a = [2.0, 3.0, 4.0]
 
  sum = LibSum.sum(a.pack("d*"), a.count)
  p "The input values are in an array = #{a}"
  p "The sum = #{sum}"
  p "The split or divide by 2 = #{LibSum.split(sum)}"
EOF
end
system "ruby sum.rb"
#~ 4.5
 
 
# http://www.zenspider.com/ZSS/Products/RubyInline/
 
# gcc will be there included in DevKit which is part of a Windows install of Ruby.
# see: https://github.com/oneclick/rubyinstaller/wiki/Development-Kit
# We could add all kinds of functions to this also. Try an average function for the sum.
# Try integers in the array and see what happens. Ruby usually needs *.0 to define floats.
# The C code is declaring the variables as Doubles so Ruby should not need floats. 
