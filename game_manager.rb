require './game'
require './json/game_json'

module GameManager
  def add_game
    id = rand(1...100)
    print 'Publish date? '
    publish_date = gets.chomp
    print 'is it multiplayer? [Y/N]'
    multiplier = %w[Y y].include?(gets.chomp)
    print 'when was the last time you played this game? (DATE)'
    last_played_at = gets.chomp
    game = Game.new(id, publish_date, multiplier, last_played_at)
    @games << game
    GameJSON.new.save_data(@games)
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
end
