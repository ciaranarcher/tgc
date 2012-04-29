# my_app.rb
require 'sinatra/base'

class MyApp < Sinatra::Base
  get '/' do
    'Hello world!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end