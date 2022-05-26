require './book'
require './json/json_manager'

class BookJSON < JsonManager
  def initialize
    super('./data/book.json')
  end

  def load_data
    data = super
    data.map do |el|
      Book.new(el['id'], el['publish_date'], el['publisher'], el['cover_state'], archived: el['archived'])
    end
  end

  def save_data(objects)
    json = objects.map do |el|
      {
        'id' => el.id,
        'publish_date' => el.publish_date,
        'publisher' => el.publisher,
        'cover_state' => el.cover_state,
        'archived' => el.archived
      }
    end.to_json

    super(json)
  end
end
