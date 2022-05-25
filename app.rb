class App
  def run
    options
  end

  def menu
    [
      { 'index' => 1, 'caption' => 'List all books', 'method' => nil },
      { 'index' => 2, 'caption' => 'List all music albums', 'method' => nil },
      { 'index' => 3, 'caption' => 'List of games', 'method' => nil },
      { 'index' => 4, 'caption' => 'List all genres', 'method' => nil },
      { 'index' => 5, 'caption' => 'List all labels', 'method' => nil },
      { 'index' => 6, 'caption' => 'List all authors', 'method' => nil },
      { 'index' => 7, 'caption' => 'Add a book', 'method' => nil },
      { 'index' => 8, 'caption' => 'Add a music album', 'method' => nil },
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
end