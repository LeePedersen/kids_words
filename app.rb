require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/add_word') do
  erb(:add_word)
end

post('/words_form') do
  name = params[:word_name]
  word = Word.new(name, nil)
  word.save()
  @words = Word.all()
  erb(:words)
end

get('/word/:id') do
  @word = Word.find(params[:id].to_i)
  erb(:word)
end

get('/words/:id/add_definition') do
  # binding.pry
  @word = Word.find(params[:id].to_i)
  erb(:add_definition)
end

post('/word/:id/definition') do
  @word = Word.find(params[:id].to_i)
  definition = params[:definition]
  new_definition = Definition.new(definition, params[:id].to_i)
  @word.add_definition(new_definition)
  erb(:word)
end

get('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.edit(params[:edited])
  @words = Word.all
  erb(:words)
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete_word
  @words = Word.all
  erb(:words)
end

get('/words/:id/definition/:def_id') do
  @word = Word.find(params[:id].to_i)
  @definition = @word.definitions[params[:def_id].to_i]
  erb(:definition)
end

get('/words/:id/definition/:def_id/edit') do
  @word = Word.find(params[:id].to_i)
  @definition = @word.definitions[params[:def_id].to_i]
  erb(:edit_definition)
end

patch('/words/:id/definition/:def_id') do
  @word = Word.find(params[:id].to_i())
  @definition = @word.definitions[params[:def_id].to_i]
  @definition.edit(params[:edited])
  @words = Word.all
  erb(:word)
end

delete('/words/:id/definition/:def_id') do
  @word = Word.find(params[:id].to_i())
  @word.delete_def(params[:id].to_i())
  @words = Word.all
  erb(:word)
end
