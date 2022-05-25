require_relative 'genre'

module GenreManager
  def set_default_genres
    default_genres = [
      {
        id: 1,
        title: 'Comedy'
      },
      {
        id: 2,
        title: 'Thriller'
      }
    ]

    default_genres.each.map { |el| Genre.new(el[:id], el[:title]) }
  end

  def genre_list
    puts 'List of genres:'
    puts(set_default_genres.each_with_index.map do |el, i|
      "#{i + 1}- #{el.name}"
    end)
  end
end
