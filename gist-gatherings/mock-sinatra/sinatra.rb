require 'rack'

module Sinatra

  attr_reader :res, :req, :env
  
  def call(env)
    @env = env
    path = env["PATH_INFO"]
    path = "/"  if path.empty?
    @res = Rack::Response.new
    @req = Rack::Request.new(env)
    run path, env["REQUEST_METHOD"]
    @res.finish
  end

  def self.included(klass)
   puts "Mock Sinatra has been included"
  end

  def run(path)    
    if paths.has_key?(path)
      if before_filters.has_key?(path)
        before_filters[path].call
      end      
      paths[path].call
    else
      raise StandardError.new("No route for #{path}")
    end
  end

  def before_filters
    @before_filters ||= {}
  end

  def before(path, &block)
    puts "Defining a before filter request for #{path}" 
    before_filters[path] = block
  end

  def paths
    @paths ||= {}
  end

  def get(path, &block)
    puts "Defining a GET request for #{path}"    
    paths[path] = block
  end
  
  class << self
    def call(env)
      new.call(env)
    end
  end

end

include Sinatra