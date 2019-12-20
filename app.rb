require('sinatra')
require('sinatra/reloader')
require('./lib/word')
# require('pry')
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

#
# get('/stage/:id') do
#   @stage = Stage.find(params[:id].to_i)
#   erb(:stage)
# end
#
# get('/stages/:id/artist')do
#   @stage = Stage.find(params[:id].to_i)
#   erb(:artist)
# end
#
# post('/stages/:id/artists')do
#   @stage = Stage.find(params[:id].to_i)
#   name = params[:artist_name]
#   genre = params[:artist_genre]
#   artist = Artist.new(name, genre, nil)
#   @stage.add_artist(artist)
#   erb(:artists)
# end
#
# patch('/stages/:id/artists/:artist_id') do
#   @stage = Stage.find(params[:id].to_i())
#   artist = @stage.artists[(params[:artist_id].to_i)]
#   artist.delete
# end
