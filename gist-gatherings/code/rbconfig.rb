#!/usr/bin/env ruby
require 'rbconfig'
RUBY  = RbConfig::CONFIG['bindir'] + '/' + RbConfig::CONFIG['RUBY_INSTALL_NAME'] + RbConfig::CONFIG['EXEEXT']
BOLD  = "\e[1m"
WHITE = "\e[37m"
RED   = "\e[31m"
GREEN = "\e[32m"
YELLOW = "\e[33m"
BLACK_BG = "\e[40m"
BLUE_BG  = "\e[44m"
RESET    = "\e[0m"
DEFAULT  = "#{RESET}#{BLACK_BG}#{WHITE}"

def checking(name)
	#puts "#{BLUE_BG}--------------------------------------------------#{DEFAULT}"
	puts
	STDOUT.write("#{BOLD}Checking #{name}...#{DEFAULT}")
	STDOUT.flush
end

def result(ok, message = nil)
	if ok
		if message
			puts(" #{GREEN}#{message}#{DEFAULT}")
		else
			puts " #{GREEN}ok!#{DEFAULT}"
		end
	else
		if message
			puts(" #{RED}#{message}#{DEFAULT}")
		else
			puts " #{RED}not good#{DEFAULT}"
		end
	end
end

def check_rubygems
	checking "RubyGems"
	rubygems_paths = $LOAD_PATH.find_all do |path|
		File.exist?("#{path}/rubygems.rb")
	end
	if rubygems_paths.size == 0
		result(false, "not installed")
		puts "This Ruby interpreter does not have RubyGems installed. Please install it."
	elsif rubygems_paths.size == 1
		result(true)
	else
		result(false)
		puts
		puts "This Ruby interpreter has multiple RubyGems installations:"
		puts
		rubygems_paths.each do |path|
			file = "#{path}/rubygems.rb"
			File.read(file) =~ /VERSION = '(.+)'/
			version = $1 || "(unknown)"
			printf " * Version #{BOLD}%s#{DEFAULT} in %s\n", version, file
		end
		puts
		puts "#{YELLOW}Suggestion#{DEFAULT}: remove all of them:"
		puts
		rubygems_paths.each do |path|
			puts "  rm -rf #{path}/rubygems.rb #{path}/rubygems"
		end
		puts
		puts "...and then reinstall RubyGems."
	end
end

begin
	STDOUT.write(DEFAULT)
	STDOUT.flush
	puts "Sanity checking Ruby interpreter #{RUBY}"
	check_rubygems
ensure
	STDOUT.write(RESET)
	STDOUT.flush
end
