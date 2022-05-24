require 'date'

class Item
  attr_reader :id, :archived
  attr_accessor :publish_date, :genre

  def initialize(id, publish_date, archived: false)
    @id = id
    @publish_date = Date.parse(publish_date)
    @archived = archived
    @genre = nil
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    currentdate = Date.today
    return true if ((currentdate - @publish_date) / 365).to_i > 10

    false
  end
end
