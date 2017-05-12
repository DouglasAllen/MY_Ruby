# test-helper.rb

ENV['RACK_ENV'] = 'test'
require 'test/unit'
require 'rack/test'


require File.expand_path '../my-app.rb', __FILE__