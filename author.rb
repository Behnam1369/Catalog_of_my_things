class Author
  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  add_item(item)
  item.author = self
  @items << item
end
