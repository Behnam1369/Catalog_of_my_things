require './music_album'
require 'json'

def json_to_music_albums(string)
  JSON.parse(string).map do |el|
    MusicAlbum.new(el['name'], el['publish_date'], el['on_spotify'], archived: el['archived'])
  end
end
