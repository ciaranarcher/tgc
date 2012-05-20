require_relative 'models/file'

class TGC < Sinatra::Base
  register Sinatra::Reloader if development?

  ##
  # Config
  ##
  configure do
  end

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
    # Workout the path for use in views
    @path = request.path_info.gsub('/' , '')
    @path = @path.empty? ? 'home' : @path

    # Caching of images / CSS
    cache_control :public, :must_revalidate, :max_age => 60
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

  get '/displaypanels' do
    erb :displaypanels
  end

  get '/windowgraphics' do
    erb :windowgraphics
  end

  get '/google' do

    # Logs in.
    # You can also use OAuth. See document of
    # GoogleDrive.login_with_oauth for details.
    session = GoogleDrive.login('USER', 'TODO')

    session.upload_from_file('/Users/carcher/Documents/Blog Posts Drafts/Moving to Mercurial.md', 'mercurial.txt', :convert => false)

    # Gets list of remote files.
    for file in session.files
      p file.title
    end
    'file uploaded'
  end

  get '/publish_file' do

    f = PublishedFile.create(
      :token => '12345',
      :publisher_name => 'Ciaran',
      :email => 'carcher@blarg.com',
      :file_name => 'file.txt',
      :created_at => Time.now
    )

    "New document has PK of #{f[:id]}"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end