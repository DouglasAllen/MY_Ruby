	
class MyApp < Sinatra::Application
	
  get "/" do
    erb :index
  end	

  get "/protected_pages" do
    erb :admin_only_page
  end
end
