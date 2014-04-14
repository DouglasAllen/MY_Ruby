Shoes.app do
	background deeppink..forestgreen
	stack do
		
	  para "RELEASE_NAME: #{Shoes::RELEASE_NAME}"
	  para "RELEASE_ID: #{Shoes::RELEASE_ID}"
	  para "REVISION: #{Shoes::REVISION}"  
     para "RUBY_PLATFORM: #{RUBY_PLATFORM}"
	  para "RUBY_VERSION: #{RUBY_VERSION}"
	  para "RUBY_PATCH: #{}"
	end
end