get '/' do
	# puts "[LOG] Getting /"
	# puts "[LOG] Params: #{params.inspect}"
  erb :"static/index"
end

get '/about' do
	erb :"static/about"
end

post '/urls' do
	@url = Url.new(long_url: params[:long_url], counter: 0)
	if @url.save
		# erb :"static/index"
		@url.to_json
	else
		while @url.errors.messages[:short_url] == ["has already been taken"]
			@url.short_url = Array.new(5){[*"A".."Z", *"0".."9"].sample}.join
			@url.save
		end
		return @url.to_json
	end
end

get '/:short_url' do
	short_url = params[:short_url]
	url = Url.find_by(short_url: short_url)
	url.counter += 1
	url.save
	# byebug
	redirect "#{url.long_url}"
end

post '/geturls' do
	@url = Url.find_by(short_url: params[:short_url])
	erb :"urls/short_url"
end

get '/signup' do
	erb :"static/signup"
end

post '/create_user' do
	user = User.new(name: params[:name], email: params[:email])
	if user.save
		redirect "/user_profile/#{user.id}"
	else
		render 'static/signup'
	end
end

get '/user_profile/:id' do
	id = params[:id]
	@user = User.find(id)
	erb :"users/profile"
end

