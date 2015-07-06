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

	@user.save

	# q = Question.new(survey_id: Survey.last.id + 1, question: question)

	# q.save
	redirect to('/')
end

get '/show_survey' do
	id = session[:user_id]
	user = User.find(id)
	@user_surveys = Survey.where(author_id: id)
	erb :show_survey
end







