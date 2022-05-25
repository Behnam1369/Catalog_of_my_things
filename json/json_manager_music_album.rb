require './music_album'
require './json/json_manager'

class JsonManagerMusicAlbum < JsonManager
  def initialize
    super('./data/music_albums.json')
  end

  def load_data
    data = super
    data.map do |el|
      MusicAlbum.new(el['name'], el['publish_date'], el['on_spotify'], archived: el['archived'])
    end
  end

  def save_data(objects)
    json = objects.map do |el|
      {
        'id' => el.id,
        'publish_date' => el.publish_date,
        'on_spotify' => el.on_spotify,
        'archived' => el.archived
      }
    end.to_json
    super(json)
  end
end
