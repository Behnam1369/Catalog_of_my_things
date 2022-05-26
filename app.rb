require './json/json_manager'
require './music_album_manager'
require './json/json_manager_music_album'
require './genre_manager'
require './bookmanager'
require './labelmanager'
require './author_manager'
require './game_manager'
require './author'
require './game'
require './json/book_json'
require './json/game_json'
require 'json'

class App
  attr_reader :music_albums, :genres

  include MusicAlbumManager
  include GenreManager
  include BookManager
  include LabelManager
  include AuthorManager
  include GameManager

  def initialize
    @music_albums = JsonManagerMusicAlbum.new.load_data
    @genres = []
    @books = BookJSON.new.load_data
    @games = GameJSON.new.load_data
    @authors = []
  end

  def run
    options
  end

  def menu
    [
      { 'index' => 1, 'caption' => 'List all books', 'method' => -> { list_books(@books) } },
      { 'index' => 2, 'caption' => 'List all music albums', 'method' => method(:music_album_list) },
      { 'index' => 3, 'caption' => 'List of games', 'method' => method(:list_all_games) },
      { 'index' => 4, 'caption' => 'List all genres', 'method' => method(:genre_list) },
      { 'index' => 5, 'caption' => 'List all labels', 'method' => method(:list_labels) },
      { 'index' => 6, 'caption' => 'List all authors', 'method' => method(:list_all_authors) },
      { 'index' => 7, 'caption' => 'Add a book', 'method' => method(:add_book) },
      { 'index' => 8, 'caption' => 'Add a music album', 'method' => method(:add_music_album) },
      { 'index' => 9, 'caption' => 'Add a game', 'method' => method(:add_game) },
      { 'index' => 0, 'caption' => 'Exit the App', 'method' => nil }
    ]
  end

  def options
    puts ''
    puts 'Please select an option by typing its number. Then press "Enter" key.'
    puts(menu.each.map { |el| "#{el['index']} - #{el['caption']}" })
    command = gets.chomp
    if command == '0'
      puts 'Thanks for using the app. See you later'
      JsonManagerMusicAlbum.new.save_data(@music_albums)
    elsif command.to_i.between?(1, 9)
      op = menu.filter { |el| el['index'] == command.to_i }.first
      op['method'].call
      options
    else
      puts 'Wrong choice'
      options
    end
  end

  def add_book
    @books << super(@books.length)
    BookJSON.new.save_data(@books)
  end
end
