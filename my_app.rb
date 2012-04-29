# my_app.rb
require 'sinatra/base'
require 'sinatra/reloader'

class TGC < Sinatra::Base
  register Sinatra::Reloader if development?

  get '/' do
    erb :home
  end  

  # start the server if ruby file executed directly
  run! if app_file == $0
end