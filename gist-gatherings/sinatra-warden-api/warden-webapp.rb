

class WardenTest < Sinatra::Base

  use Warden::Manager do |manager|
    manager.default_strategies :password
    manager.failure_app = MyApplication
  end
  
  get '' do
    Warden.test_mode!
    env['warden'].authenticate!
  end

end