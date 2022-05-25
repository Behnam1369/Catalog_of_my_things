require './music_album_manager'
require './genre_manager'
require './json_writer'
require './json_reader'
require './bookmanager'
require './labelmanager'
require './author'
require './game'
require 'json'

class App
  attr_reader :music_albums, :genres

  include MusicAlbumManager
  include GenreManager
  include BookManager
  include LabelManager

  def initialize
    @music_albums = []
    @genres = []
    @books = []
    @games = []
    @authors = load_json('authors.json').map { |a| Author.new(a['id'], a['first_name'], a['last_name']) }
    load_data
  end

  def load_data
    @music_albums = json_to_music_albums(File.read('data\music_albums.json')) if File.exist? 'data\music_albums.json'
  end

  def save_data
    File.write('data\music_albums.json', music_albums_to_json(@music_albums))
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
      save_data
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
  end

  def add_game
    id = rand(1...100)
    print 'Publish date? '
    publish_date = gets.chomp
    print 'is it multiplayer? [Y/N]'
    multiplier = %w[Y y].include?(gets.chomp)
    print 'when was the last time you played this game? (DATE)'
    last_played_at = gets.chomp
    @games << Game.new(id, publish_date, multiplier, last_played_at)
    puts 'Game Added Successfully!'
    puts
  end

  def list_all_games
    if @games.empty?
      puts 'There is no any game added yet.'
    else
      puts 'List of all music albums:'
      puts(@games.each_with_index.map do |game, index|
             "Game ID.#{index + 1} - Publish Date: #{game.publish_date} " \
               "Is it multiplier: #{game.multiplier ? 'Yes' : 'No'} " \
               "Archived: #{game.archived ? 'Yes' : 'No'} "
           end)
    end
  end

  def list_all_authors
    puts 'Listing all authors:'
    @authors.each_with_index.map do |author, i|
      puts "#{i + 1}- #{"#{author.first_name} #{author.last_name}"}"
    end
    puts
  end

  def load_json(path)
    return [] unless File.exist?(path)
    return [] if File.zero?(path)

    read_path = File.read(path)
    JSON.parse(read_path, create_additions: true)
  end
end
