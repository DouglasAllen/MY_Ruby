###########
# config.ru
#
require 'bundler'
# Bundler.setup
# Bundler.require

require 'cgi'
require 'data_mapper'
# require 'rack-flash'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/json'
require 'sinatra_warden'
require 'sequel'
require 'slim'
require 'sqlite3'
require 'warden'

builder = Rack::Builder.new do
  use Rack::Reloader
  use Rack::CommonLogger
  use Rack::ShowExceptions
  use Rack::Static, urls: ['/css', '/img', '/js'], root: 'public'

  map '/auth_app' do
    require File.dirname(__FILE__) + '/auth_app'
    run Sinatra::Application
  end

  # map '/blog.refractalize.org' do
  #   require File.dirname(__FILE__) + '/blog.refractalize.org'
  #   run LoginManager
  # end

  map '/modular_style' do
    require File.dirname(__FILE__) + '/modular_style'
    run SimpleApp
  end

  map '/my-app' do
    require File.dirname(__FILE__) + '/my-app'
    run Sinatra::Application
  end

  map '/failure_app' do
    failure_app = proc { |_env| ['401', { 'Content-Type' => 'text/html' }, ['UNAUTHORIZED']] }
    use Rack::Session::Cookie, secret: 'MY_SECRET'

    use Warden::Manager do |manager|
      manager.default_strategies :password, :basic
      manager.failure_app = failure_app
    end
    run failure_app
  end

  map '/try-this' do
    require File.dirname(__FILE__) + '/try_this'
    run TryThis
  end

  map '/warden-cofig' do
    require File.dirname(__FILE__) + '/warden_conf'
    require File.dirname(__FILE__) + '/datamapper'
    run Sinatra::Application
  end

  map '/sinatra_warden' do
    require File.dirname(__FILE__) + '/sinatra_warden'
    run MyApplication
  end

  map '/warden-api-webapp' do
    require File.dirname(__FILE__) + '/warden-api-webapp'
    run SinatraWardenAPI
  end

  map '/warden-webapp/test' do
    require File.dirname(__FILE__) + '/warden-webapp'
    run WardenTest
  end

  map '/webapp' do
    require File.dirname(__FILE__) + '/webapp'
    run WebApp
  end
end.to_app

run builder
