require './music_album'

class App
  attr_reader :music_albums

  def initialize
    @music_albums = []
  end

  def run
    options
  end

  def menu
    [
      { 'index' => 1, 'caption' => 'List all books', 'method' => nil },
      { 'index' => 2, 'caption' => 'List all music albums', 'method' => method(:music_album_list) },
      { 'index' => 3, 'caption' => 'List of games', 'method' => nil },
      { 'index' => 4, 'caption' => 'List all genres', 'method' => nil },
      { 'index' => 5, 'caption' => 'List all labels', 'method' => nil },
      { 'index' => 6, 'caption' => 'List all authors', 'method' => nil },
      { 'index' => 7, 'caption' => 'Add a book', 'method' => nil },
      { 'index' => 8, 'caption' => 'Add a music album', 'method' => method(:add_music_album) },
      { 'index' => 9, 'caption' => 'Add a game', 'method' => nil },
      { 'index' => 0, 'caption' => 'Exit the App', 'method' => nil }
    ]
  end

  def options
    puts 'Please select an option by typing its number. Then press "Enter" key.'
    puts(menu.each.map { |el| "#{el['index']} - #{el['caption']}" })
    command = gets.chomp
    if command == '0'
      puts 'Thanks for using the app. See you later'
    elsif command.to_i.between?(1, 9)
      op = menu.filter { |el| el['index'] == command.to_i }.first
      op['method'].call
      options
    else
      puts 'Wrong choice'
      options
    end
  end

  def music_album_list
    if @music_albums.length.zero?
      puts 'There is no music album in the collection yet.'
    else
      puts 'List of all music albums:'
    end
    puts(@music_albums.each_with_index.map do |el, index|
      "Album No.#{index + 1} - Publish Date: #{el.publish_date} " +
      "Available On Spotify: #{el.on_spotify ? 'Yes' : 'No'} " +
      "Archived: #{el.archived ? 'Yes' : 'No'} "
    end)
  end

  def add_music_album
    last_id = @music_albums.map(&:id).max
    id = (last_id || 0) + 1
    print 'Please enter publish date: '
    publish_date = gets.chomp
    on_spotify = _on_spotify
    music_album = MusicAlbum.new(id, publish_date, on_spotify)
    @music_albums << music_album
    puts 'Music album was added to the collection successfully.'
  end

  def _on_spotify
    print 'Is this music album available on Spotify? (Y/N): '
    answer = gets.chomp
    if %w[Y y].include?(answer)
      true
    elsif %w[N n].include?(answer)
      false
    else
      puts 'Invalid input, please try again.'
      _on_spotify
    end
  end
end
