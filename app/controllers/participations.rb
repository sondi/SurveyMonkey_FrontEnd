get '/participations' do
	# @user = User.find("#{id}")
	# @user_id = session[:user_id]
	# p "esto es session: #{session[:email]}"
	
	@surveys_id = session[:surveys_id]
	erb :show_participations
end

get '/take_survey/:id' do
	erb :show_survey
end

# post '/participations' do
# 	participation = Participation.create(user_id: , surveys_id:)
# end

post '/answers' do
	
end