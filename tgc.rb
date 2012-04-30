# my_app.rb
require 'sinatra/base'
require 'sinatra/reloader'

class TGC < Sinatra::Base
  register Sinatra::Reloader if development?

  helpers do
    def top_nav_class(path)
      selected, unselected = 'class="topNavLinkSelected"', 'class="topNavLink"'
      case path
      when 'about', 'contact', 'upload', 'quote'
        selected
      else
        unselected
      end
    end

    def side_nav_class(path)
      selected, unselected = 'class="selectedLink"', 'class="navLink"'
      case path
      when 'home', 'pointofsale', 'posters', 'displaypanels', 'windowgraphics', 'bannersflags', 'exhibitions', 'digitalprint', 'designservice'
        selected
      else
        unselected
      end
    end
  end

  before do
    @path = request.path_info.gsub('/' , '')
    @path = @path.empty? ? 'home' : @path
  end

  get '/' do
    erb :home
  end

  get '/about' do
    erb :home
  end

  get '/contact' do
    erb :contact
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end