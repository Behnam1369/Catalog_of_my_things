require './item'

class Game < item
  attr_accessor :multiplier, :last_played_at

  def initialize(id, publish_date, multiplier, last_played_at, archived: false)
    super(id, publish_date, archived: archived)
    @multiplier = multiplier
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    currentdate = Date.now
    super && ((currentdate - last_played_at) / 365).to_i < 2
  end
end
