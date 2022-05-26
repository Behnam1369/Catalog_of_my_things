require './item'
class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(id, publish_date, on_spotify, archived: false)
    @on_spotify = on_spotify
    super(id, publish_date, archived: archived)
  end

  private

  def can_be_archived?
    return true if super && @on_spotify

    false
  end
end
