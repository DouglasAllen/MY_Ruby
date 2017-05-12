require File.expand_path '../sinatra', __FILE__

# Procs instances get assigned to a variable, locally stored block code can be assessed later.
get "/hi" do
  puts "I am in the hi block"
end

run("/hi")

before "/hi" do
  puts "Running before block"
  puts "------------------"
end

run("/hi")

#run("/random")  #Error