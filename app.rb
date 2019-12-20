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
  @word.update(params[:edited])
  @words = Word.all
  erb(:words)
end

# patch('/words/:id/artists/:artist_id') do
#   @word = Stage.find(params[:id].to_i())
#   artist = @word.artists[(params[:artist_id].to_i)]
#   artist.delete
# end
