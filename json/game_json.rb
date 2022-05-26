require './game'
require './json/json_manager'

class GameJSON < JsonManager
  def initialize
    super('./data/game.json')
  end

  def load_data
    data = super
    data.map do |el|
      Game.new(el['id'], el['publish_date'], el['multiplier'], el['last_played_at'], archived: el['archived'])
    end
  end

  def save_data(objects)
    json = objects.map do |el|
      {
        'id' => el.id,
        'publish_date' => el.publish_date,
        'multiplier' => el.multiplier,
        'last_played_at' => el.last_played_at,
        'archived' => el.archived
      }
    end.to_json

    super(json)
  end
end
