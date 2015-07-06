get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  @surveys = Survey.all
  erb :index_survey
end
