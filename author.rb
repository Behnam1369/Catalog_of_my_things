class Author
  attr_accessor :name
  attr_reader :id

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    item.author = self
    @items << item
  end
end
