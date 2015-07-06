# Whitelist for /register, /login, /
before do
	pass if ['login', 'register', nil].include? request.path_info.split('/')[1]
	if session[:user_id] == nil
		# puts "No existe una sesion"
		session[:errors] = "No existe una sesion"
		# @error = session[:error]
		redirect to("/")
	end
end

post '/users' do
	email = params[:email]
	password = params[:password]
	@user = User.create(email: email, password: password)
	redirect to("/users/#{@user.id}")
end

get '/users/:id' do
	id = params[:id]
	@user = User.find("#{id}")
	erb :show_user
end

get '/users/:id/edit' do
	id = params[:id]
	@user = User.find("#{id}")
	erb :edit_user
end

post '/users/:id' do
	name = params[:name]
	email = params[:email]
	password = params[:password]
	id = params[:id]
	user = User.find(id)
	if password == ""
		user.update(email: email)
	else
		user.update(email: email, password: password)	
	end
	redirect to("/users/#{id}")
end

post '/users/:id/delete' do
	id = params[:id]
	user = User.destroy(id)
	session.clear
	redirect to ('/')
end

get '/users/:id/participations' do
	id = params[:id]
	@user = User.find(id)
	@participations = @user.participated_surveys
	erb :show_participations
end

post '/register' do
	name = params[:name]
	email = params[:email]
	password = params[:password]
  @user = User.new(name: name, email: email, password: password)
	
  if @user.save
		session[:user_id] = @user.id
		redirect to("/users/#{@user.id}")
	else
	  puts @user.errors
	  session[:errors] = @user.errors.messages
		erb :index
	end
end

post '/login' do
	email = params[:email]
	password = params[:password]
	user = User.authenticate(email, password)
	if user
		id = user.id
		session[:email] = params[:email]
		session[:user_id] = id
		redirect to("/users/#{id}")		
	else
		session[:errors] = "Datos incorrectos"
		erb :index
	end
end

get '/logout' do
	session.clear
	redirect to('/')
end



