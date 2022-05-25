require './item'

class Game < Item
  attr_accessor :multiplier, :last_played_at, :publish_date

  def initialize(id, publish_date, multiplier, last_played_at, archived: false)
    super(id, publish_date, archived: archived)
    @multiplier = multiplier
    @last_played_at = Date.parse(last_played_at)
  end

  private

  def can_be_archived?
    currentdate = Date.today
    super && ((currentdate - last_played_at) / 365).to_i > 2
  end
end
