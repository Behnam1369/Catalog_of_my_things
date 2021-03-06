require 'date'
require_relative 'label'

class Item
  attr_reader :id, :archived
  attr_accessor :publish_date, :label, :genre, :author

  def initialize(id, publish_date, archived: false)
    @id = id
    @publish_date = Date.parse(publish_date)
    @archived = archived
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
