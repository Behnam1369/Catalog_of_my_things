require './item'
class Genre
  attr_reader :id, :items
  attr_accessor :name

  def initialize(id, name)
    @id = id,
          @name = name,
          @items = []
  end

  def add_item(item)
    item.genre = self
    @items.push(item)
  end
end
