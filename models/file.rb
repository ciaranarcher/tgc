DB = Sequel.connect(ENV['DATABASE_URL'])

class PublishedFile < Sequel::Model(:files)
end