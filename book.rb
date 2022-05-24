require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(id, publish_date, publisher, cover_state, archived: false)
    super(id, publish_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    return true if super || @cover_state == 'bad'

    false
  end
end
