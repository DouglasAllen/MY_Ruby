myapp = Rack::Builder.app do
          use Rack::CommonLogger
          run lambda { |env| 
            [ 200, 
              {'Content-Type' => 'text/html"}, 
              env.sort.map {|k, v| "#{k}=>#{v}</br>"}
            ]
          }
        end
  
sessioned = Rack::Session::Pool.new(myapp,
              :domain => 'foo.com',
              :expire_after => 2592000
            )
            
Rack::Handler::WEBrick.run sessioned