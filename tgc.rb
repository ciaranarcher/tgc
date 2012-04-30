# my_app.rb
require 'sinatra/base'
require 'sinatra/reloader'

class TGC < Sinatra::Base
  register Sinatra::Reloader if development?

  ##
  # Helpers
  ##
  helpers do
    def top_nav_class(path, link)
      selected, unselected = 'class="topNavLinkSelected"', 'class="topNavLink"'

      if path == link
        selected
      else
        unselected
      end
    end

    def side_nav_class(path, link)
      selected, unselected = 'class="selectedLink"', 'class="navLink"'
      
      if path == link
        selected
      else
        unselected
      end
    end
  end

  ##
  # Filters
  ##
  before do
    @path = request.path_info.gsub('/' , '')
    @path = @path.empty? ? 'home' : @path
  end

  ##
  # Main routes
  ##
  get '/' do
    erb :home
  end

  get '/about' do
    erb :home
  end

  get '/contact' do
    erb :contact
  end

  get '/pointofsale' do
    erb :pos
  end

  get '/posters' do
    erb :posters
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end