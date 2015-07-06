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
	session[:user_id] = id
	q = Question.new(survey_id: Survey.last.id + 1, question: question)
	Choice.new(question_id: q.id, choice: choice_1)
	Choice.new(question_id: q.id, choice: choice_2)
	Choice.new(question_id: q.id, choice: choice_3)
	Survey.new(user_id: id, name: name)
	redirect to('/')
end

get '/show_survey' do
	session[:user_id] = id
	user = User.find(id)
	@user_surveys = Survey.find_by(user_id: id)
	erb :show_survey
end







