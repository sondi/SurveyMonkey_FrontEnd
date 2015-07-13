get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  @surveys = Survey.all
  erb :index_survey
end

get '/new_survey' do
	erb :new_survey
end

# FALTA PONER EL HECHO DE QUE SE PUEDAN CREAR MAS PREGUNTAS, DE MOMENTO SOLO 
# ACEPTA UNA
post '/create_survey' do
	question = params[:question]
	choice_1 = params[:option_1]
	choice_2 = params[:option_2]
	choice_3 = params[:option_3]
	name = params[:survey_title]
	# id = session[:user_id]
	# @user = User.find(id)
	
	@survey = Survey.new(name: name)
	current_user.authored_surveys <<	@survey
	
	@question = Question.new(question: question)
	@survey.questions << @question
	
	@choice1 = Choice.create(choice: choice_1)
	@choice2 = Choice.create(choice: choice_2)
	@choice3 = Choice.create(choice: choice_3)

	@question.choices << @choice1 << @choice2 << @choice3

	@survey.save

	# q = Question.new(survey_id: Survey.last.id + 1, question: question)

	# q.save
	redirect to("/show_survey/#{@survey.id}")
end

get '/show_survey/:id' do
	survey_id = params[:id]
	@survey = Survey.find(survey_id)
	erb :show_survey
end

get '/show_survey' do
	
	@user_surveys = current_user.authored_surveys
	# Survey.where(user_id: current_user.id)

	erb :user_survey
end

get '/review_survey/:id' do
	id = params[:id]
	@survey = Survey.find(id)
	erb :review_survey

end

post '/edit_survey/:id' do
	id_s = params[:id]
	survey = Survey.find(id_s)
	survey.update(name: params[:title])
	id_q = survey.questions[0].id
	question = Question.find(id_q)
	question.update(question: params[:question])

	choice_1 = params[:choice_1]
	choice_2 = params[:choice_2]
	choice_3 = params[:choice_3]
	question.choices[0].update(choice: choice_1)
	question.choices[1].update(choice: choice_2)
	question.choices[2].update(choice: choice_3)
end

get	'/delete_survey/:id' do
	id = params[:id]
	Survey.find(id).destroy
end














