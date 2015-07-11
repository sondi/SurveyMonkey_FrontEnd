get '/participations' do
	# @user = User.find("#{id}")
	# @user_id = session[:user_id]
	# p "esto es session: #{session[:email]}"
	
	@surveys_id = session[:surveys_id]
	erb :show_participations
end

get '/take_survey/:id' do
	survey_id = params[:id]
	@survey = Survey.find(survey_id)
	erb :take_survey
end

post '/take_survey/:id' do
	survey_id = params[:id]
	choice_id = params[:choice]
	if logged_in?
		user_id = current_user.id
	else
		user_id = nil
	end
	
	@participation = Participation.new(user_id: user_id, survey_id: survey_id)

	@answer = Answer.create(choice_id: choice_id)

	@participation.answers << @answer

	@participation.save

	redirect to("/survey_answered/#{@participation.id}")

end

get '/survey_answered/:id' do
	participation_id = params[:id]
	@participation = Participation.find(participation_id)
	@survey = @participation.survey

	@choice_ids = @participation.answers.map { |answer| answer.choice_id }

	erb :survey_answered

end

# post '/participations' do
# 	participation = Participation.create(user_id: , surveys_id:)
# end

post '/answers' do
	
end
