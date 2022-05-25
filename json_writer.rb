require './music_album'
require 'json'

def music_albums_to_json(objects)
  objects.map do |el|
    {
      'id' => el.id,
      'publish_date' => el.publish_date,
      'on_spotify' => el.on_spotify,
      'archived' => el.archived
    }
  end.to_json
end
